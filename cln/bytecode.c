#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <strings.h>
#include <assert.h>
#include <stdio.h>

#include "definitions.h"

char verbose = 0x01;
#define dbg if (verbose == 0x01) printf

void dbg_on() { verbose = 0x01; }
void dbg_mute() { verbose = 0x00; }

//====================
// BYTECODE instrukce
//====================

void st_check(int address) {
    
    if ( address > STACK_SIZE + 1) {
        fprintf(stderr, " \e[31mStack overflow\e[39m\n");
        abort();
    }
    
    if ( address < 0 ) {
        fprintf(stderr, " \e[31mStack underflow\e[39m\n");
        abort();
    }
}

// push_i 0x03 
// vloz hodnotu na zasobnik
void push_i(int value) {
    st_check(st->sp);           // kontrola jestli ukazuju jeste na platny 
                                // slot zasobniku - je totiz validni ukazovat
                                // na slot tesne za zasobnikem (abych mohl
                                // provadet pop z posledniho slotu stacku)
    st->start[st->sp] = value;  // na adresu SP dej hodnotu
    st->sp++;
}

// pop_i 0x04
// vydej hodnotu ze zasobniku
int pop_i() {
    st_check(st->sp - 1);   // tady se musim podivat o krok zpet
    st->sp--;
    return st->start[st->sp];
}

// dup 0x05
// duplikuje vrchol stacku
void dup() {
    int top = pop_i();
    push_i(top);
    push_i(top);
}

// Alokace 0x0c 
// necha naalokovat pole int-u
// a adresu zacatku da na stack
void alloc(int size) {
    int addr = allocate(g, size);
    dbg(" +M%d", addr);
    push_i(addr);
}

// kontrola pameti (jsem stale v pozadovanem bloku ?)
void mem_check(int base_address, unsigned int offset) {
    
    // na base_address je ulozen size toho objektu
    // protoze je to pole, musi byt offset ostre mensi
    // pokud by byl roven tak uz je to preteceni
    if (g->mem[base_address] < offset ) {
        fprintf(stderr, " \e[31mOut of array bounds - %d indexed, but array is size of %d\e[39m\n", 
                offset, g->mem[base_address]);
        abort();
    }
}

// Ulozeni do pameti 0x0d
// ten base address je tam proto, 
// abych dokazal rict, zda je po 
// aplikaci offsetu adresa jeste 
// stale patrici k tomu puvodnimu
// kusu pameti nebo uz jsem mimo
void ist() {

    // protoze se muze nechat vypocitat
    // jak obsah tak i index, je potreba
    // vsecho brat pres stack

    // jako posledni se na stack dava 
    // obsah ktery chci ulozit
    int value = pop_i();

    // pak je tam index
    unsigned int offset = pop_i();    
    
    // a konecne adresa pole
    int base_address = pop_i();
    
    // kontrola indexu pameti
    mem_check(base_address, offset);

    dbg(" 0x%02x -> M%d+%d", value, base_address, offset);

    // vem obsah zasobniku a popni ho
    // do pameti - vem obsah
    g->mem[base_address + offset] = value;
}

// Cteni z pameti 0x0e
void ild() {

    // protoze se muze nechat vypocitat
    // jak obsah tak i index, je potreba
    // vsecho brat pres stack
    
    // nejprve je tam index
    unsigned int offset = pop_i();    
    
    // pak adresa pole
    int base_address = pop_i();
    
    // kontrola indexu pameti
    mem_check(base_address, offset);

    // ziskej obsah
    int value = g->mem[base_address + offset];
    dbg(" M%d+%d: %d", base_address, offset, value);

    // proved push ten pameti na stack
    push_i(value);
}

// ARITMETIKA
// -- 4B operace

// iadd 0x25
void iadd() {
    int op1 = pop_i();
    int op2 = pop_i();
    push_i(op2 + op1);
}

// isub 0x26
void isub() {
    int op1 = pop_i();
    int op2 = pop_i();
    push_i(op2 - op1);
}

// imul 0x27
void imul() {
    int op1 = pop_i();
    int op2 = pop_i();
    push_i(op2 * op1);  // TODO preteceni ??
}

// idiv 0x28
void idiv() {
    int op1 = pop_i();
    int op2 = pop_i();
    push_i(op2 / op1);
}

// imod 0x29
void imod() {
    int op1 = pop_i();
    int op2 = pop_i();
    push_i(op2 % op1);
}

// ineg 0x2a
void ineg() {
    int op = pop_i();
    push_i(-op);
}

// BOOL OPERACE
// -- 4B operace

// ior 0x2b
void ior() {
    int op1 = pop_i();
    int op2 = pop_i();
    push_i(op2 | op1);
}

// iand 0x2c
void iand() {
    int op1 = pop_i();
    int op2 = pop_i();
    push_i(op2 & op1);
}

// POROVNAVANI
// -- 4B operace

// ine 0x2f
void ine() {
    int op1 = pop_i();
    int op2 = pop_i();
    push_i(op2 != op1);
}

// igt 0x30
void igt() {
    int op1 = pop_i();
    int op2 = pop_i();
    push_i(op2 > op1);
}

// ige 0x31
void ige() {
    int op1 = pop_i();
    int op2 = pop_i();
    push_i(op2 >= op1);
}

// ilt 0x32
void ilt() {
    int op1 = pop_i();
    int op2 = pop_i();
    push_i(op2 < op1);
}

// ile 0x33
void ile() {
    int op1 = pop_i();
    int op2 = pop_i();
    push_i(op2 <= op1);
}

// ieq 0x34
void ieq() {
    int op1 = pop_i();
    int op2 = pop_i();
    push_i(op2 == op1);
}

// RIZENI BEHU PROGRAMU

// jmp 0x11
void jmp(unsigned int adr) {
    if ( adr >= pr->size) {
        fprintf(stderr, " \e[31m Invalid address %d (0x%02x)\e[39m\n", adr, adr);
        abort();
    }
    pr->ip = adr;
}

// jneq 0x10 
// jump if not equal
void jneq(unsigned int adr) {
    if (pop_i() == 0) jmp(adr);
}

// call 0x09
// http://unixwiz.net/techtips/win32-callconv-asm.html
// call od adresy (parametry jsou jiz ulozene na zasobniku !!!)
// POZOR -- FP ukazuje na prvni pole noveho ramce, takze pod nim
// pri volani neni adresa stareho FP - ta je adresu za nim !!! (lepe se to psalo)
void call(int address) {
    // tyto dve instrukce jsou umyslne prohozene, aby se mohlo s 
    // navratovou hodnotou hned pracovat
    push_i(pr->ip);     // vlozi na zasobnik navratovou adresu nasledujici instrukce 
                        // (+1 protoze ted je ip na instrukci call, ktera prave bezi...)
    push_i(st->fp);     // vlozi na zasobnik stary fp    
    st->fp = st->sp;    // nastav novy fp
    pr->ip = address;   // skoc na telo funkce
}

// main ma trochu specialni call, 
// protoze jeho navratova
// adresa je konec souboru
void main_call(int address) {
    push_i(pr->size);   // tady je ten hacek - z mainu se vraci na konec programu
    push_i(st->fp);     // vlozi na zasobnik stary fp    
    st->fp = st->sp;    // nastav novy fp
    pr->ip = address;   // skoc na telo funkce
}

// return 0x0a
// navratova hodnota je int a je to posledni udaj na zasobniku
void ret() {
    ret_reg = pop_i();  // zapis navratovou hodnotu 
    st->sp = st->fp;    // nastav vrchol zasobniku na zacatek ramce
    st->fp = pop_i();   // ziskej stary fp
    pr->ip = pop_i();   // ziskej navratovou adresu
}

// push obsahu ret_regu 0x0b
// je to proto, aby se mohl 
// vycistit zasobnik od parametru
// a nesmazala se zaroven u toho 
// ta navratova hodnota
// http://www.tenouk.com/Bufferoverflowc/Bufferoverflow2a.html
void rer() {
    push_i(ret_reg);
}

// pop stack to locale 0x1d
// locals jsou cislovane od 0
void psl(unsigned int offset) {
    st_check(st->fp + offset);
    int value = pop_i();
    dbg(" 0x%02x -> L%d", value, offset);
    st->start[st->fp + offset] = value;
}

// push locale on stack 0x1e
// locals jsou cislovane od 0
void pls(unsigned int offset) {
    st_check(st->fp + offset);
    push_i(st->start[st->fp + offset]);
}

// pop stack to argument 0x2d
// argumenty jsou cislovane od 0
void psa(unsigned int offset) {
    // krok pres stare FP, pres IP, 
    // a na zacatek parametru
    int stepback = 3;
    st_check(st->fp - offset - stepback);  
    int value = pop_i();
    dbg(" 0x%02x -> A%d", value, offset);
    st->start[st->fp - offset - stepback] = value;
}

// push argument to stack 0x2e
// argumenty jsou cislovane od 0
void pas(unsigned int offset) {
    // krok pres stare FP, pres IP, 
    // na zacatek parametru
    int stepback = 3;
    st_check(st->fp - offset - stepback); 
    push_i(st->start[st->fp - offset - stepback]);
}

// control output 0x12
void out() {
    int value = pop_i(); 
    printf("0x%02x (%d)", value, value);
    fprintf(output_file, "%d\n", value);
}
