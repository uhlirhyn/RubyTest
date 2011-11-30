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
  
    // push / pop
    push(15);
    test(pop() == 15);
    
    // push_i / pop_i
    push_i(256);
    test(pop_i() == 256);

    // push_p / pop_p
    push_p((char *) g);   
    test((struct gc *) pop_p() == g);

    // call
    char * _sp = st->sp;
    char * _fp = st->fp;
    pr->ip = 15;
    call(2);
    test(pr->ip == 2);
    push_i(3);

    // ret
    ret();
    test(pop_i() == 3);
    test(pr->ip == 20); // pokracuje dal v puvodnich instrukcich
    test(st->fp == _fp);
    test(st->sp == _sp);
   
    // locale store / load
    sl_c(15,2);
    test(ll_c(2) == 15);

    // argumenty store / load
    push(20);   // arg1
    push(25);   // arg0
    call(5);
    test(la_c(0) == 25);
    test(la_c(1) == 20);
    sa_c(65,0); // change arg0
    sa_c(30,1); // change arg1
    test(la_c(0) == 65);
    test(la_c(1) == 30);
    push_i(10);
    ret();
    test(pop_i() == 10);
    test(pop() == 65);
    test(pop() == 30);
    
    printf("\n Arithmetic tests: ");

    // add
    push_i(10);
    push_i(3);
    iadd();
    test(pop_i() == 13);

    // sub
    push_i(3);
    push_i(10);
    isub();
    test(pop_i() == 7);

    // mul
    push_i(10);
    push_i(3);
    imul();
    test(pop_i() == 30);

    // div
    push_i(3);
    push_i(10);
    idiv();
    test(pop_i() == 3);

    // mod
    push_i(3);
    push_i(10);
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
    push_i(3);
    push_i(10);
    igt();
    test(pop_i() == 0x01);
    push_i(3);
    push_i(3);
    igt();
    test(pop_i() == 0x00);
    push_i(15);
    push_i(10);
    igt();
    test(pop_i() == 0x00);

    // ge
    push_i(3);
    push_i(10);
    ige();
    test(pop_i() == 0x01);
    push_i(3);
    push_i(3);
    ige();
    test(pop_i() == 0x01);
    push_i(15);
    push_i(10);
    ige();
    test(pop_i() == 0x00);

    // lt
    push_i(3);
    push_i(10);
    ilt();
    test(pop_i() == 0x00);
    push_i(3);
    push_i(3);
    ilt();
    test(pop_i() == 0x00);
    push_i(15);
    push_i(10);
    ilt();
    test(pop_i() == 0x01);

    // le
    push_i(3);
    push_i(10);
    ile();
    test(pop_i() == 0x00);
    push_i(3);
    push_i(3);
    ile();
    test(pop_i() == 0x01);
    push_i(15);
    push_i(10);
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
