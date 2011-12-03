#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <strings.h>
#include <assert.h>
#include <stdio.h>

#include "definitions.h"

//====================
// BYTECODE instrukce
//====================

void st_check(char * address) {
    
    if ( address > st->start + STACK_SIZE + 1) {
        fprintf(stderr, " \e[31mStack overflow\e[39m\n");
        abort();
    }
    
    if ( address < st->start ) {
        fprintf(stderr, " \e[31mStack underflow\e[39m\n");
        abort();
    }
}

// push 0x01 
// vloz 1B hodnotu na zasobnik
void push(char value) {
    st_check(st->sp);
    *(st->sp) = value;      // na adresu SP dej hodnotu
    st->sp++;
}

// pop 0x02
// vydej 1B hodnotu ze zasobniku
char pop() {
    st_check(st->sp - 1);
    st->sp--;
    return *(st->sp);
}

// push_i 0x03 
// vloz 4B hodnotu na zasobnik
void push_i(int value) {
    st_check(st->sp + 3);       // +3 protoze na te 4. uz SP je
    *((int *) st->sp) = value;  // na adresu SP dej hodnotu
    st->sp += 4;
}

// pop_i 0x04
// vydej 4B hodnotu ze zasobniku
int pop_i() {
    st_check(st->sp - 4);   // tady musim ale krokovat zpet opravdu o ty 4
    st->sp -= 4;
    return *((int *) st->sp);
}

// push_p 0x07 
// vloz pointer na zasobnik
void push_p(char * value) {
    st_check(st->sp + sizeof(char *) - 1);  // viz push_i
    *((char **) st->sp) = value;            // na adresu SP dej hodnotu
    st->sp += sizeof(char *);
}

// pop_p 0x08
// vydej pointer ze zasobniku
char * pop_p() {
    st_check(st->sp - sizeof(char *));
    st->sp -= sizeof(char *);
    return *((char **) st->sp);
}

// Alokace 
// necha naalokovat pole int-u
// a adresu zacatku da na stack
void aloc(int size) {
    push_i((int) allocate(g, size));
}

// Ulozeni do pameti 
// ten base address je tam proto, 
// abych dokazal rict, zda je po 
// aplikaci offsetu adresa jeste 
// stale patrici k tomu puvodnimu
// kusu pameti nebo uz jsem mimo
void ist(int base_address, int offset) {

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
    push_p(st->fp);     // vlozi na zasobnik stary fp    
    st->fp = st->sp;    // nastav novy fp
    pr->ip = address;   // skoc na telo funkce
}

// main ma trochu specialni call, 
// protoze jeho navratova
// adresa je konec souboru
void main_call(int address) {
    push_i(pr->size);   // tady je ten hacek - z mainu se vraci na konec programu
    push_p(st->fp);     // vlozi na zasobnik stary fp    
    st->fp = st->sp;    // nastav novy fp
    pr->ip = address;   // skoc na telo funkce
}

// return 0x0a
// navratova hodnota je int a je to posledni udaj na zasobniku
void ret() {
    ret_reg = pop_i();  // zapis navratovou hodnotu 
    st->sp = st->fp;    // nastav vrchol zasobniku na zacatek ramce
    st->fp = pop_p();   // ziskej stary fp
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

// pop stack to locale 4B 0x1d
// locals jsou cislovane od 0
void psl(unsigned int offset) {
    st_check(st->fp + offset * 4);
    *((int *) (st->fp + offset * 4)) = pop_i();
}

// push locale on stack 4B 0x1e
// locals jsou cislovane od 0
void pls(unsigned int offset) {
    st_check(st->fp + offset * 4);
    push_i(*((int *) (st->fp + offset * 4)));
}

// pop stack to argument 4B 0x2d
// argumenty jsou cislovane od 0
void psa(unsigned int offset) {
    // krok pres stare FP (4B), pres IP (4B), 
    // a na zacatek parametru
    // offset je ted 4x vetsi (int)
    int stepback = 3 * sizeof(char *);
    st_check(st->fp - offset * 4 - stepback);  
    *((int *) (st->fp - offset * 4 - stepback)) = pop_i();
}

// push argument to stack 4B 0x2e
// argumenty jsou cislovane od 0
void pas(unsigned int offset) {
    // krok pres stare FP (4B), pres IP (4B), 
    // na zacatek parametru
    // offset je ted 4x vetsi (int)
    int stepback = 3 * sizeof(char *);
    st_check(st->fp - offset * 4 - stepback); 
    push_i(*((int *) (st->fp - offset * 4 - stepback)));
}

// control output 0x12
void out() {
    int value = pop_i(); 
    printf("0x%02x (%d)", value, value);
    fprintf(output_file, "%d\n", value);
}
