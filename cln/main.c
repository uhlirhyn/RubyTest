#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <strings.h>
#include <stdio.h>
#include <limits.h>

#include "bytecode.h"
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
    g->size = HEAP_SIZE / 2;
    g->slots = g->size / sizeof(vm_val);
    g->slots += g->size % sizeof(vm_val) == 0 ? 0 : 1;
    g->size = g->slots * sizeof(vm_val);

    // newspace
    g->mem = (vm_val *) malloc(g->size);
    
    // oldspace
    g->old = (vm_val *) malloc(g->size);

    //==========
    //  STACK
    //==========

    // alokace prostoru zasobniku
    st->slots = STACK_SIZE / sizeof(vm_val);
    st->slots += STACK_SIZE % sizeof(vm_val) == 0 ? 0 : 1;
    st->size = st->slots * sizeof(vm_val);

    // opet je potreba aby velikost byla zaokrouhlena
    // na celociselny nasobek slot_size
    st->start = malloc(st->size);

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
// size - pozadovana velikost v vm_val 
vm_val * allocate(gc * gcl, unsigned int slots) {      

    vm_val * next = gcl->free;

    // najdi takovou velikost volneho prostoru kam by se tohle veslo
    while (next) {

        // pokud jsem nasel dost velke misto, 
        // uprav freelist a vrat na nej referenci
        // je potreba kontrolovat o jeden zaznam navic
        // protoze se nejprve zapisuje udaj o velikosti
        if (next->head.slots >= slots + 1) {

            // pokud za alokovanym mistem neni uz zadny
            // freespace (vyslo to presne)
            // pak nezmensuj ale rovnou preskoc na dalsi 
            // polozku o volnem miste
            // opet - musim to porovnavat vuci 
            // (array size slot) + (data slot) = 2
            // pokud nejsou volne aspon 2 sloty je to plne
            if (next->head.slots - slots - 1 < 2 ) { 

                gcl->free = next->body.nx;

            } else {

                // posuv sice probiha jiz pred tim, nez
                // muze na alokovane misto dojit k zapisu,
                // bohuzel, informaci o next si muze prepsat
                // sam freelist, protoze se muze posunout tak,
                // ze na misto stareho next, prijde nove size
                // polozce size takove nebezpeci nehrozi, protoze
                // se zapisuje jako prvni
                vm_val * old_next = next->body.nx;

                // je tam jeste kus mista,
                // odecti ho a zaloz "uprav"
                // polozku freelistu                                             
                gcl->free = next - slots - 1;   // posuv - pouzil jsem 
                                                // slot pro array size 
                                                // a pak ty data sloty
                gcl->free->body.nx = old_next;  // naslednik je stejny 
                
                // zmensi size
                gcl->free->head.slots = next->head.slots - slots - 1;
            }
        
            return next;

        } else {    
            // jinak pokracuj dal
            printf("\t%d can't fit into %d\n", slots, next->head.slots - 1);
            next = next->body.nx;
        }
    }

    // doslo misto nenasel jsem dost velky kus- next == NULL
    // scavenge()
    printf("Out of heap ... collecting garbage (***TODO***)\n");
    
    fprintf(stderr, " \e[31mOut of memory ...\e[39m\n");
    abort();

}

int main ( int argc, char **argv ) {

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
    printf(" Mem loc.:\t%p - %p\n",g->mem, g->mem + g->size);
    printf(" Mem size:\t%d B (%d slots)\n",g->size, g->slots);
    printf(" Stack loc.:\t%p - %p\n",st->start, st->start + st->size);
    printf(" Stack size:\t%d B (%d slots)\n",st->size, st->slots);
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
