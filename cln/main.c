#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <strings.h>
#include <stdio.h>

#include "bytecode.h"
#include "definitions.h"
#include "tests.h"

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

// vynuluje ciselniky apod. - vyresetuje VM
void reset_vm() {

    //==========
    //    GC
    //==========

    // vynuluj pamet
    bzero((void*) g->mem, g->real_size);
    bzero((void*) g->old, g->real_size);

    // zalozeni freelistu;
    g->list = (freelist *) g->mem;
    g->list->size = g->real_size;
    g->list->next = NULL;

    //==========
    //  STACK
    //==========
    
    st->sp = st->start;
    st->fp = st->start;

    //===========
    //  PROGRAM
    //===========
    
    pr->ip = 0;
}

void init() {

    //==========
    //    GC
    //==========

    // alokace meho pametoveho prostoru
    g->real_size = HEAP_SIZE / 2;
    g->mem = (obj *) malloc(g->real_size);
    
    // oldspace
    g->old = (obj *) malloc(g->real_size);

    //==========
    //  STACK
    //==========

    st->start = malloc(STACK_SIZE);

    //===========
    //  PROGRAM
    //===========
    
    pr->size = load_file(pr->filename, &pr->bytes);
    if (pr->size < 0) { 
        puts("\e[31mError loading file\e[0m");
        abort();
    } 

    reset_vm();

}

void mem_dump(gc * gcl, int grouping) {

    char * mem = (char*) gcl->mem;

    printf("----------------------------------------\n");
    printf("  HEAP DUMP \n");
    printf("----------------------------------------\n");

    int i=0; 
    while (i < gcl->real_size / sizeof(char)) {
        printf("%p:", mem+i);
        for (int j=0; j < grouping; j++) {
            printf("\t%X ",*(mem + i++));
            if (i > gcl->real_size/sizeof(char)) break;
        }
        printf("\n");
    }

}

void print_freelist(gc * gcl) {

    printf("----------------------------------------\n");
    printf("  FREE LIST \n");
    printf("----------------------------------------\n");

    freelist * next = gcl->list;

    while(next != NULL) {

        printf("Address: %p, %d B, next freespace on %p\n",
                next, next->size, next->next);

        next = next->next;
    }
}

// alokuj v GC pameti 
// gc - garbage collector
// size - pozadovana velikost v bytech
void * allocate(gc * gcl, int size) {  

    freelist * next = gcl->list;

    // najdi takovou velikost volneho prostoru kam by se tohle veslo
    while(next != NULL) {

        // pokud jsem nasel dost velke misto, 
        // uprav freelist a vrat na nej referenci
        if (next->size >= size) {

            // pokud za alokovanym mistem neni uz zadny
            // freespace (vyslo to presne) nebo tam neni 
            // misto na udaj o dalsim volnem miste (tedy
            // freespace o velikosti freelist struktury,
            // pak nezmensuj ale rovnou preskoc na dalsi 
            // polozku o volnem miste
            if (next->size - size < sizeof(freelist)) { 

                gcl->list = next->next;

            } else {

                // posuv sice probiha jiz pred tim, nez
                // muze na alokovane misto dojit k zapisu,
                // bohuzel, informaci o next si muze prepsat
                // sam freelist, protoze se muze posunout tak,
                // ze na misto stareho next, prijde nove size
                // polozce size takove nebezpeci nehrozi, protoze
                // se zapisuje jako prvni
                freelist * old_next = next->next;

                // je tam jeste kus mista,
                // odecti ho a zaloz "uprav"
                // polozku freelistu                                             
                gcl->list = (freelist *) ((void *) next + size);    // posuv
                printf("oldsize: %d size:%d\n", next->size, size);
                gcl->list->size = next->size - size;    // zmensi jeho velikost
                printf("freesize %d\n", gcl->list->size);
                gcl->list->next = old_next;           // naslednik je stejny
            }
        
            return next;

        } else {    
            // jinak pokracuj dal
            printf("\t%d can't fit into %d\n", size, next->size);
            next = next->next;
        }
    }

    // doslo misto nenasel jsem dost velky kus- next == NULL
    // scavenge()
    printf("Out of heap ... collecting garbage (***TODO***)\n");
    
    fprintf(stderr, " \e[31mOut of memory ...\e[39m\n");
    abort();

}

// Pri vytvyreni stringu se naalokuje misto pro tento retezec,
// pokud se pak String zmeni, vraci se nova instance (neslo by
// jen tak najednou protahnout to pole char-u) - to je taky duvod
// proc je pridavani do stringu tak neefektivni a proc java ma
// implementovan StringBuilder
char * new_str(gc * gcl, char * str) {

    // alokuj novou pamet pro string
    // strlen je potreba zvestit o 1 protoze se zapisuje
    // sice jenom (napriklad) jeden znak ale jeste se zapisuje \0
    char * s = (char *) allocate(gcl, strlen(str) + 1);

    // kopiruje stylem cil-zdroj
    strcpy( s, str );
    return s;
}

// console mark
void cm() {
    printf("giraffe > ");
}

int read_str(char * text) {

    if ( scanf("%s", text) != 0 ) {
        
        // search for newline character
        char *newline = strchr(text, '\n'); 
        if ( newline != NULL )
            *newline = '\0'; // overwrite trailing newline
    }

    return strlen(text);

}

int read_number(int * number) {

    if ( scanf("%d", number) != 0 ) {
        return 1;
    }

    return 0;

}

void store_number(obj * o, int value) {

    *((int *) o) = value;

}

//===============
// VM EXECUTION
//===============

// vezme dalsi byte z bytecodu
char next() {
    return pr->bytes[pr->ip++];
}

// http://www.cprogramming.com/tutorial/cfileio.html
// http://www.ibm.com/developerworks/ibm/library/it-haggar_bytecode/
void run() {

    char opcode;
    char pc;
    int pi;
    char pa[4];

    // skoc na "main"
    // prvni int v souboru je adresa mainu
    pa[3] = next();
    pa[2] = next();
    pa[1] = next();
    pa[0] = next();
    pi = *((int *) pa);

    // zavolej main
    printf(" Header 4B: \e[33m-- Main found on %d (0x%02x)\e[0m\n", pi, pi);
    call(pi);

    // provadej instrukce
    while (pr->ip < pr->size) {

        opcode = next();
        printf(" Byte: 0x%02x ", opcode);

        switch (opcode) {
        case 0x01:
            printf("\e[36m-- push \e[0m");
            pc = next();
            printf("\e[36m%c (0x%02x)\e[0m",pc ,pc);
            push(pc);
            break;
        case 0x0a:
            printf("\e[36m-- ret \e[0m");
            ret();
            break;
        case 0x02:
            printf("\e[36m-- pop \e[0m");
            pop();
            break;
        case 0x09:
            printf("\e[36m-- call \e[0m");
            pa[3] = next();
            pa[2] = next();
            pa[1] = next();
            pa[0] = next();
            pi = *((int *) pa);
            printf("\e[36m%d (0x%02x)\e[0m",pi ,pi);
            call(pi);
            break;
        case 0x03:
            printf("\e[36m-- push_i \e[0m");
            pa[3] = next();
            pa[2] = next();
            pa[1] = next();
            pa[0] = next();
            pi = *((int *) pa);
            printf("\e[36m%d (0x%02x)\e[0m",pi ,pi);
            push_i(pi);
            break;
        case 0x00:
            printf("\e[36m-- nop\e[0m");
            break;
        case 0x0f:
            printf("\e[36m-- out_c\e[0m");
            out_c();
            break;

        // aritmetika
        case 0x25:
            printf("\e[36m-- iadd\e[0m ");
            iadd();
            break;
        case 0x26:
            printf("\e[36m-- isub\e[0m ");
            isub();
            break;
        case 0x27:
            printf("\e[36m-- imul\e[0m ");
            imul();
            break;
        case 0x28:
            printf("\e[36m-- idiv\e[0m ");
            idiv();
            break;
        case 0x29:
            printf("\e[36m-- imod\e[0m ");
            imod();
            break;
        case 0x2a:
            printf("\e[36m-- ineg\e[0m ");
            ineg();
            break;

        // bool operace
        case 0x2b:
            printf("\e[36m-- ior\e[0m ");
            ior();
            break;
        case 0x2c:
            printf("\e[36m-- iand\e[0m ");
            iand();
            break;

        // porovnavani
        case 0x2f:
            printf("\e[36m-- ine\e[0m ");
            ine();
            break;
        case 0x30:
            printf("\e[36m-- igt\e[0m ");
            igt();
            break;
        case 0x31:
            printf("\e[36m-- ige\e[0m ");
            ige();
            break;
        case 0x32:
            printf("\e[36m-- ilt\e[0m ");
            ilt();
            break;
        case 0x33:
            printf("\e[36m-- ile\e[0m ");
            ile();
            break;
        case 0x34:
            printf("\e[36m-- ieq\e[0m ");
            ieq();
            break;

        // jine
        case 0x12:
            printf("\e[36m-- out\e[0m ");
            out();
            break;
        default:
            printf("\e[33m-- WARNING: Uknown opcode 0x%02x (ignored)\e[0m", opcode);
        }

        printf("\n");
    }

}

int main ( int argc, char **argv ) {

    // zaloz GC a alokuj pamet
    // zaloz stack
    gc gcl;
    stack stk;
    program prg;
    
    g = &gcl;
    st = &stk;
    pr = &prg;

    // TODO kontrola existence parametru
    pr->filename = argv[1];

    init();

    printf("----------------------------------------\n");
    printf(" Giraffe !\n----------------------------------------\n");

    printf(" Mem loc.:\t%p - %p\n",g->mem, g->mem + g->real_size);
    printf(" Mem size:\t%d B\n",g->real_size);
    printf(" Stack loc.:\t%p - %p\n",st->start, st->start + STACK_SIZE);
    printf(" Stack size:\t%d B\n",STACK_SIZE);

    printf("----------------------------------------\n");

    // BYTECODE test ... 
    tests(g, st, pr);
    
    printf("----------------------------------------\n");
    printf(" Interpreting '%s' (%d bytes)\n", pr->filename, pr->size);
    printf("----------------------------------------\n");
    
    reset_vm(); // vyresetuj VM po testech
    run();

    printf("----------------------------------------\n");

    // uvolni pamet
    free(g->mem);
    free(st->start);

}
