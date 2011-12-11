#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <strings.h>
#include <stdio.h>

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
    bzero((void*) g->mem, g->size);
    bzero((void*) g->old, g->size);

    // zalozeni freelistu;
    g->free = g->mem;
    g->freeslots = g->slots;

    //==========
    //  STACK
    //==========

    st->sp = st->start;
    st->fp = st->start;

    //===========
    //  PROGRAM
    //===========

    pr->ip = 0;
    
    //===========
    //    IO
    //===========
    
    // ...
}

// vezme dalsi byte z bytecodu
char next() {
    return pr->bytes[pr->ip++];
}

void bytecode_switch(char opcode) {

    int pi;
    char pa[4];
    char type;

    switch (opcode) {

        // stack operace
    case 0x03:
        printf("\e[36m-- push \e[0m");
        type = next();
        pa[3] = next();
        pa[2] = next();
        pa[1] = next();
        pa[0] = next();
        pi = *((int *) pa);
        printf("\e[36m%d (%02x:0x%02x)\e[0m",pi ,type ,pi);
        push(create_value(pa, type));
        break;
    case 0x04:
        printf("\e[36m-- pop \e[0m");
        pop();
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
        printf("\e[36m %d + 1 slots (%d bytes)\e[0m", pi, (pi + 1) * sizeof(vm_val));
        alloc(create_integer(pi));
        break;
    case 0x1c:
        printf("\e[36m-- clalloc\e[0m");
        clalloc();
        break;
    case 0x0d:
        printf("\e[36m-- ist \e[0m");
        ist();
        break;
    case 0x0e:
        printf("\e[36m-- ild \e[0m");
        ild();
        break;
    case 0x1f:
        printf("\e[36m-- szof \e[0m");
        szof();
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
        call(create_i_pointer(pi));
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
        jneq(create_i_pointer(pi));
        break;
    case 0x0f:
        printf("\e[36m-- jeq \e[0m");
        pa[3] = next();
        pa[2] = next();
        pa[1] = next();
        pa[0] = next();
        pi = *((int *) pa);
        printf("\e[36m%d (0x%02x)\e[0m",pi ,pi);
        jeq(create_i_pointer(pi));
        break;
    case 0x11:
        printf("\e[36m-- jmp \e[0m");
        pa[3] = next();
        pa[2] = next();
        pa[1] = next();
        pa[0] = next();
        pi = *((int *) pa);
        printf("\e[36m%d (0x%02x)\e[0m",pi ,pi);
        jmp(create_i_pointer(pi));
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
        psa(create_slot_id(pi));
        break;
    case 0x2e:
        printf("\e[36m-- pas\e[0m ");
        pa[3] = next();
        pa[2] = next();
        pa[1] = next();
        pa[0] = next();
        pi = *((int *) pa);
        printf("\e[36m%d (0x%02x)\e[0m",pi ,pi);
        pas(create_slot_id(pi));
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
        psl(create_slot_id(pi));
        break;
    case 0x1e:
        printf("\e[36m-- pls\e[0m ");
        pa[3] = next();
        pa[2] = next();
        pa[1] = next();
        pa[0] = next();
        pi = *((int *) pa);
        printf("\e[36m%d (0x%02x)\e[0m",pi ,pi);
        pls(create_slot_id(pi));
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

        // IO
    case 0x12:
        printf("\e[36m-- out\e[0m ");
        out();
        break;
    case 0x13:
        printf("\e[36m-- fo\e[0m ");
        fo();
        break;
    case 0x14:
        printf("\e[36m-- rn\e[0m ");
        rn();
        break;
    case 0x15:
        printf("\e[36m-- cf\e[0m ");
        fc();
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
    main_call(create_i_pointer(pi));
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
