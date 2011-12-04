#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <strings.h>
#include <stdio.h>

#include "bytecode.h"
#include "definitions.h"
#include "interpret.h"
#include "tests.h"
#include "options.h"
#include "debugger.h"

void scavenge(gc * gcl) {

    //....

}

// http://www.anyexample.com/programming/c/how_to_load_file_into_memory_using_plain_ansi_c_language.xml
int load_file(const char *filename, char **result) { 
    
    int size = 0;
    FILE * f = fopen(filename, "rb");

    if (f == NULL) { 
        *result = NULL;
        return -1;      // -1 means file opening fail 
    } 

    fseek(f, 0, SEEK_END);
    size = ftell(f);
    fseek(f, 0, SEEK_SET);
    *result = (char *) malloc(size + 1);
    
    if (size != fread( *result, sizeof(char), size, f)) { 
        free(*result);
        return -2;      // -2 means file reading fail 
    } 
    
    fclose(f);
    (*result)[size] = 0;
    return size;
}

void init() {

    //==========
    //    GC
    //==========

    // alokace meho pametoveho prostoru
    g->real_size = HEAP_SIZE / 2;
    int ratio = g->real_size / slot_size;
    int rest = g->real_size % slot_size;
    g->size = ratio + (rest == 0 ? 0 : 1);
    g->real_size = g->size * slot_size;

    // je potreba aby velikost byla zaokrouhlena
    // na celociselny nasobek slot_size

    // newspace
    g->mem = (obj *) malloc(g->real_size);
    
    // oldspace
    g->old = (obj *) malloc(g->real_size);

    //==========
    //  STACK
    //==========

    // alokace prostoru zasobniku
    ratio = STACK_SIZE / slot_size;
    rest = STACK_SIZE % slot_size;
    st->size = ratio + (rest == 0 ? 0 : 1);

    // opet je potreba aby velikost byla zaokrouhlena
    // na celociselny nasobek slot_size
    st->real_size = st->size * slot_size;
    st->start = malloc(st->real_size);

    // stackova maska (zaokrouhleno na byty)
    // na kazdy slot potrebuju bit ... 
    // ze char ma 8b tomu snad muzu verit 
    int mask_size = st->size + (st->size % 8==0 ? 0 : 1);
    stack_mask = (char *) malloc(mask_size);   
    bzero((void*) stack_mask, mask_size);

    //===========
    //  PROGRAM
    //===========
    
    pr->size = load_file(pr->filename, &pr->bytes);
    if (pr->size < 0) { 
        puts("\e[31mError loading file\e[0m");
        abort();
    } 

    reset_vm();

    //===========
    //  OUTPUT
    //===========

    output_file = fopen(output_filename, "w");
    if (output_file == NULL) {
        fprintf(stderr, "\e[31mError in opening a file %s\e[39m\n", output_filename);
        exit (-1);
    }

}

// alokuj v GC pameti 
// gc - garbage collector
// size - pozadovana velikost v 4B (int)
int allocate(gc * gcl, int size) {  

    size = size + ALLOC_HEADER;   
    int next_index = gcl->list;
    freelist * next;

    // najdi takovou velikost volneho prostoru kam by se tohle veslo
    // gcl->size je tady nahradou za NULL v pripade adresovani pointery
    while(next_index != gcl->size) {

        next = (freelist *) (gcl->mem + next_index);

        // pokud jsem nasel dost velke misto, 
        // uprav freelist a vrat na nej referenci
        if (next->size >= size) {

            // pokud za alokovanym mistem neni uz zadny
            // freespace (vyslo to presne) nebo tam neni 
            // misto na udaj o dalsim volnem miste (tedy
            // freespace o velikosti freelist struktury,
            // pak nezmensuj ale rovnou preskoc na dalsi 
            // polozku o volnem miste
            if (next->size - size < FREELIST_SIZE) { 

                gcl->list = next->next;

            } else {

                // posuv sice probiha jiz pred tim, nez
                // muze na alokovane misto dojit k zapisu,
                // bohuzel, informaci o next si muze prepsat
                // sam freelist, protoze se muze posunout tak,
                // ze na misto stareho next, prijde nove size
                // polozce size takove nebezpeci nehrozi, protoze
                // se zapisuje jako prvni
                int old_next = next->next;

                // je tam jeste kus mista,
                // odecti ho a zaloz "uprav"
                // polozku freelistu                                             
                gcl->list = next_index + size;  // posuv
                freelist * new = (freelist *) (gcl->mem + gcl->list);
                new->size = next->size - size;  // zmensi jeho velikost
                new->next = old_next;           // naslednik je stejny
            }
        
            return next_index;

        } else {    
            // jinak pokracuj dal
            printf("\t%d can't fit into %d\n", size, next->size);
            next_index = next->next;
        }
    }

    // doslo misto nenasel jsem dost velky kus- next == NULL
    // scavenge()
    printf("Out of heap ... collecting garbage (***TODO***)\n");
    
    fprintf(stderr, " \e[31mOut of memory ...\e[39m\n");
    abort();

}

int main ( int argc, char **argv ) {

    // definice systemove velikosti slotu
    slot_size = sizeof(int);

    // systemove promenne
    gc gcl;
    stack stk;
    program prg;
    
    // ukazetelova forma sys. prom.
    g = &gcl;
    st = &stk;
    pr = &prg;

    // kontrola parametru
    if (argc < 3) { 
        fprintf(stderr, "\e[33mMissing parameter(s) - please enter the input and output file:\e[39m\n\n\tgrf INPUTFILE OUTPUTFILE\n\n");
        exit (0);
    }

    // naparsuj zbytek moznosti
    parse_options(argc, argv);

    // ziskani nazvu I/O
    pr->filename = argv[1];
    output_filename = argv[2];
    
    // zaloz GC a alokuj pamet
    // zaloz stack
    init();

    printf("----------------------------------------\n");
    printf(" \e[1;33mGiraffe\e[31m!\e[0m\n");
    printf("----------------------------------------\n");
    printf(" Mem loc.:\t%p - %p\n",g->mem, g->mem + g->real_size);
    printf(" Mem size:\t%d B (%d slots)\n",g->real_size, g->size);
    printf(" Stack loc.:\t%p - %p\n",st->start, st->start + st->real_size);
    printf(" Stack size:\t%d B (%d slots)\n",st->real_size, st->size);
    printf("----------------------------------------\n");

    // BYTECODE test ... 
    tests(g, st, pr);
   
    // zapni vypisy
    dbg_on();

    // vyresetuj VM po testech
    reset_vm(); 
    
    // kdo bude ridit vedeni programu ?
    if (debugger) {
        // uzivatel
        printf("----------------------------------------\n");
        printf(" Debugging '%s' (%d bytes)\n", pr->filename, pr->size);
        printf("----------------------------------------\n");
        debug(); 
    } else {
        // automat
        printf("----------------------------------------\n");
        printf(" Interpreting '%s' (%d bytes)\n", pr->filename, pr->size);
        printf("----------------------------------------\n");
        run();
    }

    printf("----------------------------------------\n");

    // uvolni pamet
    free(g->mem);
    free(st->start);
    fclose(output_file);

}
