#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <strings.h>
#include <stdio.h>

#include "definitions.h"
#include "bytecode.h"

//===============
// VM EXECUTION
//===============

// vynuluje ciselniky apod. - vyresetuje VM
void reset_vm() {

    //==========
    //    GC
    //==========

    // vynuluj pamet
    bzero((void*) g->mem, g->real_size);
    bzero((void*) g->old, g->real_size);

    // zalozeni freelistu;
    g->list = 0;
    freelist * f = ((freelist *) (g->mem));
    f->size = g->size;
    f->next = g->size;

    //==========
    //  STACK
    //==========
    
    st->sp = 0;
    st->fp = 0;

    //===========
    //  PROGRAM
    //===========
    
    pr->ip = 0;
}

// vezme dalsi byte z bytecodu
char next() {
    return pr->bytes[pr->ip++];
}

void bytecode_switch(char opcode) {
    
    int pi;
    char pa[4];

    switch (opcode) {

        // stack operace
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
    case 0x04:
        printf("\e[36m-- pop_i \e[0m");
        pop_i();
        break;
    case 0x05:
        printf("\e[36m-- dup \e[0m");
        dup();
        break;

    case 0x00:
        printf("\e[36m-- nop\e[0m");
        break;

        // operace s pameti
    case 0x0c:
        printf("\e[36m-- alloc\e[0m");
        pa[3] = next();
        pa[2] = next();
        pa[1] = next();
        pa[0] = next();
        pi = *((int *) pa);
        printf("\e[36m %d slots (%d bytes)\e[0m", pi, pi * slot_size);
        alloc(pi);
        break;
    case 0x0d:
        printf("\e[36m-- ist \e[0m");
        ist();
        break;
    case 0x0e:
        printf("\e[36m-- ild \e[0m");
        ild();
        break;

        // rizeni behu programu
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
    case 0x0a:
        printf("\e[36m-- ret \e[0m");
        ret();
        break;
    case 0x0b:
        printf("\e[36m-- rer \e[0m");
        rer();
        break;
    case 0x10:
        printf("\e[36m-- jneq \e[0m");
        pa[3] = next();
        pa[2] = next();
        pa[1] = next();
        pa[0] = next();
        pi = *((int *) pa);
        printf("\e[36m%d (0x%02x)\e[0m",pi ,pi);
        jneq(pi);
        break;
    case 0x11:
        printf("\e[36m-- jmp \e[0m");
        pa[3] = next();
        pa[2] = next();
        pa[1] = next();
        pa[0] = next();
        pi = *((int *) pa);
        printf("\e[36m%d (0x%02x)\e[0m",pi ,pi);
        jmp(pi);
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

        // operace s argumenty
    case 0x2d:
        printf("\e[36m-- psa\e[0m ");
        pa[3] = next();
        pa[2] = next();
        pa[1] = next();
        pa[0] = next();
        pi = *((int *) pa);
        printf("\e[36m%d (0x%02x)\e[0m",pi ,pi);
        psa(pi);
        break;
    case 0x2e:
        printf("\e[36m-- pas\e[0m ");
        pa[3] = next();
        pa[2] = next();
        pa[1] = next();
        pa[0] = next();
        pi = *((int *) pa);
        printf("\e[36m%d (0x%02x)\e[0m",pi ,pi);
        pas(pi);
        break;

        // operace s lokalnimi promennymi
    case 0x1d:
        printf("\e[36m-- psl\e[0m ");
        pa[3] = next();
        pa[2] = next();
        pa[1] = next();
        pa[0] = next();
        pi = *((int *) pa);
        printf("\e[36m%d (0x%02x)\e[0m",pi ,pi);
        psl(pi);
        break;
    case 0x1e:
        printf("\e[36m-- pls\e[0m ");
        pa[3] = next();
        pa[2] = next();
        pa[1] = next();
        pa[0] = next();
        pi = *((int *) pa);
        printf("\e[36m%d (0x%02x)\e[0m",pi ,pi);
        pls(pi);
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
}

void run_main() {

    int pi;
    char pa[4];

    // zkontroluj, ze soubor ma aspon 4B
    if (pr->size < 4) {
        fprintf(stderr, " \e[31m Invalid grfc file\n");
        abort();
    }

    // skoc na "main"
    // prvni int v souboru je adresa mainu
    pa[3] = next();
    pa[2] = next();
    pa[1] = next();
    pa[0] = next();
    pi = *((int *) pa);

    // zavolej main
    printf(" Header 4B: \e[33m-- Main found on %d (0x%02x)\e[0m\n", pi, pi);
    main_call(pi);
}

// proved cely program a na nic se neptej
void run() {  

    char opcode;

    // nejprve projdi hlavicku BC souboru
    run_main();

    // provadej instrukce
    while (pr->ip < pr->size) {
        opcode = next();
        printf(" Byte: 0x%02x ", opcode);
        bytecode_switch(opcode);
        printf("\n");
    }
}