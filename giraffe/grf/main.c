#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <strings.h>
#include <stdio.h>
#include <limits.h>

#include "bytecode.h"
#include "interpret.h"
#include "options.h"
#include "debugger.h"

// prozkouma obsah slotu,
// pokud je v nem pointer
// vrati novy pointer od
// presunuteho objektu,
// k nahrade stavajiciho
// jinak vrati NULL
vm_val * examine_slot(vm_val * slot) {

    vm_val * source = NULL;         // odkud kopiruju
    vm_val * target = NULL;         // kam prave kopiruju (base + offset)
    vm_val * destination = NULL;    // kam kopiruju (base)
    int size = 0;                   // jak je to velike 
    vm_val * changed_rf = NULL;     // rekurzivni zmena reference

    // vem udaj v cili
    // a zkontroluj jestli neni pointer
    // pokud je, vem udaj z pameti a 
    // zkopiruj ho do vedle
    // pokud neni vrat NULL
    if (slot->head.type != POINTER) return NULL;

    // vem referenci na ten cil
    source = slot->body.rf;

    // zkontroluj ze prvni udaj je opravdu
    // size pole - vsechno na HEAP predchazi
    // udaj o tom kolik toho tam je
    // - vyjimka je SCAVENGED - to znamena,
    // ze jsem tady uz byl
    switch (source->head.type) {
    case ARRAY_SIZE:
        // ok, tak to ma byt
        // jak je to tedy velike ?
        size = source->body.sz;
        break;
    case SCAVENGED:
        // uz jsem tady byl
        // tak vrat to, kam
        // se to presunulo
        return source->body.rf;
    default:
        // chyba ... 
        fprintf(stderr,"\e[31mAssert error during scavenge - expecting ARRAY_SIZE or SCAVENGED\e[0m");
        abort();
    }

    // drz si kam zapisujes - g->free 
    // muzou menit potomci v rekurzi
    // a musi byt dopredu nastaveno
    // za moji velikost
    target = g->free;
    destination = target;

    // posun free dle moji velikosti
    // a udaji o velikosti 
    int consumed_space = source->body.sz + 1;
    g->free += consumed_space;      // kde zacina dalsi volne misto
    g->freeslots -= consumed_space;  // kolik toho mista je

    // zkopiruje ARRAY_SIZE slot do cile
    memcpy(target, source, sizeof(vm_val));
    target++;

    // oznac to stare za nalezene
    // a do obsahu schovej novy 
    // pointer
    source->head.type = SCAVENGED;
    source->body.rf = destination;

    // pro vsechny jeho pole zkontroluj ze je to POINTER
    // pokud je, tak zkopiruj do nove pameti uz novy pointer
    // jinak kopiruj stary obsah
    // (prvni pole preskoc, tam je ten array size)
    for (int i=1; i <= size; i++) {
                        
        changed_rf = examine_slot(source + i);  
        
        // pokud se vratil pointer,
        // tak doslo k presunu
        // nastav pointer na novy cil
        if (changed_rf) {
            target->head.type = POINTER;
            target->body.rf = changed_rf;
        } else { // jinak zkopiruj tu hodnotu (target, source)
            memcpy(target, source + i, sizeof(vm_val));
        }

        // a dalsi policko
        target++;

    }

    // vrat ten novy pointer
    return destination;

}

// zatim delam scavenge jenom na tech polich
void scavenge() {

    dbg("\n \e[33mGC colleted "); 

    // inicializace - prohod prostory
    vm_val * old_space = g->mem;
    g->mem = g->old;
    g->old = old_space;

    // pro log
    int old_freeslots = g->freeslots;

    // novy freespace 
    // a nove misto
    g->free = g->mem;
    g->freeslots = g->slots;

    // zacneme prohledavat zasobnik, 
    // coz je muj global ENV
    vm_val * slot = st->start;
    vm_val * changed_rf = NULL;

    // vychazi ze zasobniku
    // projdi ho (od zacatku do SP)
    // a nech si vracet hodnoty - pokud prijde
    // pointer, pak se narazilo na 
    // pointer a doslo u nej k presunu
    for (int i=0; slot < st->sp; i++) {
        changed_rf = examine_slot(slot);
        if (changed_rf) {
            slot->body.rf = changed_rf;
        } // jinak hodnotu nechava tak jak je
        slot++;
    }

    dbg("%d slots - resume alloc:\e[0m ", g->freeslots - old_freeslots); 

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
    g->size = heap_size / 2;
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
    st->slots = stack_size / sizeof(vm_val);
    st->slots += stack_size % sizeof(vm_val) == 0 ? 0 : 1;
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
    //    IO
    //===========

    fds = (FILE **) malloc(sizeof(FILE **) * fds_count);
    free_fds = fds_count;

}

// alokuj v GC pameti 
// gc - garbage collector
// size - pozadovana velikost v vm_val 
vm_val * simple_allocate(unsigned int slots) {      

    slots += 1; // je potreba slot na velikost 

    // vejde se ?
    if (g->freeslots >= slots) {
        vm_val * allocated_space = g->free;
        g->free += slots;       // posuv na dalsi adresu
        g->freeslots -= slots;  // snizeni poctu volnych slotu
        return allocated_space;
    }

    // doslo misto nenasel jsem dost velky kus- next == NULL
    return NULL;

}

// alokuj v GC pameti 
// gc - garbage collector
// size - pozadovana velikost v vm_val 
vm_val * allocate(unsigned int slots) {      

    // pokusil jsem se uz o GC ?
    char after_scavenge = 0;

    while (1) {
        
        // alokuj
        vm_val * allocated = simple_allocate(slots);
    
        if (allocated) {
            return allocated;
        } else {
            // nezdarilo se ?
            if (after_scavenge) {
                // uz jsem o GC pokousel ...
                fprintf(stderr, " \e[31mOut of memory ...\e[39m\n");
                abort();
            }

            // zkusim GC !
            scavenge();
            after_scavenge = 1;
        }           
    }
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

    // init systemovych hodnot
    debugger = 0;
    heap_size = DEFAULT_HEAP_SIZE;
    stack_size = DEFAULT_STACK_SIZE;
    fds_count = DEFAULT_FD_COUNT;

    // kontrola parametru
    if (argc < 2) { 
        fprintf(stderr, "\e[33mMissing parameter(s) - please enter the input and output file:\e[39m\n\n\tgrf [INPUTFILE]\n\n");
        exit (0);
    }

    // naparsuj zbytek moznosti
    parse_options(argc, argv);

    // ziskani nazvu I/O
    pr->filename = argv[1];
    
    // zaloz GC a alokuj pamet
    // zaloz stack
    init();
    
    // vyresetuj VM po testech
    reset_vm(); 
    
    // kdo bude ridit vedeni programu ?
    if (debugger) {
        // uzivatel
        printf("----------------------------------------\n");
        printf(" \e[1;33mGiraffe\e[31m!\e[0m\n");
        printf("----------------------------------------\n");
        printf(" Mem loc.:\t%p - %p\n",g->mem, (void *) g->mem + g->size);
        printf(" Old loc.:\t%p - %p\n",g->old, (void *) g->old + g->size);
        printf(" Mem size:\t%d B (%d slots)\n",g->size, g->slots);
        printf(" Slot size:\t%d\n", sizeof(vm_val));
        printf(" Stack loc.:\t%p - %p\n",st->start, (void *) st->start + st->size);
        printf(" Stack size:\t%d B (%d slots)\n",st->size, st->slots);
        printf(" Max FDs:\t%d\n",fds_count);
        printf("----------------------------------------\n");
        printf(" Debugging '%s' (%d bytes)\n", pr->filename, pr->size);
        printf("----------------------------------------\n");
        debug(); 
    } else {
        // automat
        run();
        printf("\n");
    }


    // uvolni pamet
    free(g->mem);
    free(st->start);

}
