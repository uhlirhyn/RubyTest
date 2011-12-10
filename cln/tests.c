#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <stdio.h>

#include "bytecode.h"

#define test(t) { assert(t); printf("\e[1m\e[32m|\e[0m"); }

// BYTECODE test ... 
void tests(gc * g, stack * st, program * pr) {

    printf(" Stack tests: ");
    
    // nechci nic slyset ...
    dbg_mute();
/*
    // push / pop
    push(create_integer(256));
    test(return_integer(pop()) == 256);
    push(create_boolean(256));
    test(return_boolean(pop()) == 256);
    push(create_pointer(256));
    test(return_pointer(pop()) == 256);
    push(create_s_pointer(256));
    test(return_s_pointer(pop()) == 256);

    // call
    int _sp = st->sp;
    int _fp = st->fp;
    pr->ip = 15;
    call(create_s_pointer(2));
    test(pr->ip == 2);
    push(create_integer(3));

    // ret
    ret();
    rer();
    test(return_integer(pop()) == 3);
    test(pr->ip == 15); // pokracuje dal v puvodnich instrukcich
    test(st->fp == _fp);
    test(st->sp == _sp);
   
    // locale store / load
    push(create_integer(0));  // vytvor sloty 
    push(create_integer(0));
    push(create_integer(0));
    push(create_integer(15));
    psl(create_s_pointer(2));
    pls(create_s_pointer(2));
    test(return_integer(pop()) == 15);

    // argumenty store / load
    push(create_integer(20));   // arg1
    push(create_integer(25));   // arg0
    call(create_s_pointer(5));
    pas(create_s_pointer(0));
    test(return_integer(pop()) == 25);
    pas(create_s_pointer(1));
    test(return_integer(pop()) == 20);
    push(create_integer(65));
    psa(create_s_pointer(0)); // change arg0
    push(create_integer(30));
    psa(create_s_pointer(1)); // change arg1
    pas(create_s_pointer(0));
    test(return_integer(pop()) == 65);
    pas(create_s_pointer(1));
    test(return_integer(pop()) == 30);
    push(create_integer(10));
    ret();
    pop();    // odstran arg0
    pop();    // odstran arg1
    rer();
    test(return_integer(pop()) == 10);
  */  
    printf("\n Arithmetic tests: ");
/*
    // add
    push(create_integer(10));
    push(create_integer(3));
    iadd();
    test(return_integer(pop()) == 13);
    push(create_integer(10));
    push(create_integer(-3));
    iadd();
    test(return_integer(pop()) == 7);

    // sub
    push(10);
    push(3);
    isub();
    test(pop() == 7);
    push(10);
    push(15);
    isub();
    test(pop() == -5);

    // mul
    push(10);
    push(3);
    imul();
    test(pop() == 30);

    // div
    push(10);
    push(3);
    idiv();
    test(pop() == 3);

    // mod
    push(10);
    push(3);
    imod();
    test(pop() == 1);

    // neg
    push(10);
    ineg();
    test(pop() == -10);
    push(-10);
    ineg();
    test(pop() == 10);

    // or
    push(0x00000019);
    push(0x00000036);
    ior();
    test(pop() == 0x0000003F);

    // and
    push(0x00000019);
    push(0x00000036);
    iand();
    test(pop() == 0x00000010);
*/
    printf("\n Comparing tests: ");
  /*  
    // ne
    push(10);
    push(3);
    ine();
    test(pop() == 0x01);
    push(10);
    push(10);
    ine();
    test(pop() == 0x00);

    // gt
    push(10);
    push(3);
    igt();
    test(pop() == 0x01);
    push(3);
    push(3);
    igt();
    test(pop() == 0x00);
    push(10);
    push(15);
    igt();
    test(pop() == 0x00);

    // ge
    push(10);
    push(3);
    ige();
    test(pop() == 0x01);
    push(3);
    push(3);
    ige();
    test(pop() == 0x01);
    push(10);
    push(15);
    ige();
    test(pop() == 0x00);

    // lt
    push(10);
    push(3);
    ilt();
    test(pop() == 0x00);
    push(3);
    push(3);
    ilt();
    test(pop() == 0x00);
    push(10);
    push(15);
    ilt();
    test(pop() == 0x01);

    // le
    push(10);
    push(3);
    ile();
    test(pop() == 0x00);
    push(3);
    push(3);
    ile();
    test(pop() == 0x01);
    push(10);
    push(15);
    ile();
    test(pop() == 0x01);

    // eq
    push(3);
    push(3);
    ieq();
    test(pop() == 0x01);
    push(5);
    push(3);
    ieq();
    test(pop() == 0x00);
*/
    printf("\n");

    // end of tests
   
}
