#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <stdio.h>

#include "bytecode.h"
#include "definitions.h"

#define test(t) { assert(t); printf("\e[1m\e[32m|\e[0m"); }

// BYTECODE test ... 
void tests(gc * g, stack * st, program * pr) {

    printf(" Stack tests: ");
    
    // nechci nic slyset ...
    dbg_mute();

    // push_i / pop_i
    push_i(256);
    test(pop_i() == 256);

    // call
    int _sp = st->sp;
    int _fp = st->fp;
    pr->ip = 15;
    call(2);
    test(pr->ip == 2);
    push_i(3);

    // ret
    ret();
    rer();
    test(pop_i() == 3);
    test(pr->ip == 15); // pokracuje dal v puvodnich instrukcich
    test(st->fp == _fp);
    test(st->sp == _sp);
   
    // locale store / load
    push_i(0);  // vytvor sloty 
    push_i(0);
    push_i(0);
    push_i(15);
    psl(2);
    pls(2);
    test(pop_i() == 15);

    // argumenty store / load
    push_i(20);   // arg1
    push_i(25);   // arg0
    call(5);
    pas(0);
    test(pop_i() == 25);
    pas(1);
    test(pop_i() == 20);
    push_i(65);
    psa(0); // change arg0
    push_i(30);
    psa(1); // change arg1
    pas(0);
    test(pop_i() == 65);
    pas(1);
    test(pop_i() == 30);
    push_i(10);
    ret();
    pop_i();    // odstran arg0
    pop_i();    // odstran arg1
    rer();
    test(pop_i() == 10);
    
    printf("\n Arithmetic tests: ");

    // add
    push_i(10);
    push_i(3);
    iadd();
    test(pop_i() == 13);
    push_i(10);
    push_i(-3);
    iadd();
    test(pop_i() == 7);

    // sub
    push_i(10);
    push_i(3);
    isub();
    test(pop_i() == 7);
    push_i(10);
    push_i(15);
    isub();
    test(pop_i() == -5);

    // mul
    push_i(10);
    push_i(3);
    imul();
    test(pop_i() == 30);

    // div
    push_i(10);
    push_i(3);
    idiv();
    test(pop_i() == 3);

    // mod
    push_i(10);
    push_i(3);
    imod();
    test(pop_i() == 1);

    // neg
    push_i(10);
    ineg();
    test(pop_i() == -10);
    push_i(-10);
    ineg();
    test(pop_i() == 10);

    // or
    push_i(0x00000019);
    push_i(0x00000036);
    ior();
    test(pop_i() == 0x0000003F);

    // and
    push_i(0x00000019);
    push_i(0x00000036);
    iand();
    test(pop_i() == 0x00000010);

    printf("\n Comparing tests: ");
    
    // ne
    push_i(10);
    push_i(3);
    ine();
    test(pop_i() == 0x01);
    push_i(10);
    push_i(10);
    ine();
    test(pop_i() == 0x00);

    // gt
    push_i(10);
    push_i(3);
    igt();
    test(pop_i() == 0x01);
    push_i(3);
    push_i(3);
    igt();
    test(pop_i() == 0x00);
    push_i(10);
    push_i(15);
    igt();
    test(pop_i() == 0x00);

    // ge
    push_i(10);
    push_i(3);
    ige();
    test(pop_i() == 0x01);
    push_i(3);
    push_i(3);
    ige();
    test(pop_i() == 0x01);
    push_i(10);
    push_i(15);
    ige();
    test(pop_i() == 0x00);

    // lt
    push_i(10);
    push_i(3);
    ilt();
    test(pop_i() == 0x00);
    push_i(3);
    push_i(3);
    ilt();
    test(pop_i() == 0x00);
    push_i(10);
    push_i(15);
    ilt();
    test(pop_i() == 0x01);

    // le
    push_i(10);
    push_i(3);
    ile();
    test(pop_i() == 0x00);
    push_i(3);
    push_i(3);
    ile();
    test(pop_i() == 0x01);
    push_i(10);
    push_i(15);
    ile();
    test(pop_i() == 0x01);

    // eq
    push_i(3);
    push_i(3);
    ieq();
    test(pop_i() == 0x01);
    push_i(5);
    push_i(3);
    ieq();
    test(pop_i() == 0x00);

    printf("\n");

    // end of tests
   
}
