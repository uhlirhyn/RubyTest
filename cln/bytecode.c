#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <strings.h>
#include <assert.h>
#include <stdio.h>

#include "bytecode.h"

char verbose = 0x01;
#define dbg if (verbose == 0x01) printf

void dbg_on() { verbose = 0x01; }
void dbg_mute() { verbose = 0x00; }

//====================
// BYTECODE instrukce
//====================

void type_checker(vm_val value, char pointer) {
    
    if ( value.type != pointer) {
        fprintf(stderr, " \e[31mRuntime exception: bad data type\e[39m\n");
        abort();
    }

}

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

vm_val create_val(int data, char type) {   
    vm_val val;
    val.type = type;
    val.data = data;
    return val;
}

vm_val create_boolean(int data) {
    return create_val(data, BOOLEAN);
}

int return_boolean(vm_val value) {
    type_checker(value, BOOLEAN);
    return value.data;
}

vm_val create_s_pointer(int data) {
    return create_val(data, S_POINTER);
}

int return_s_pointer(vm_val value) {
    type_checker(value, S_POINTER);
    return value.data;
}

vm_val create_pointer(int data) {
    return create_val(data, POINTER);
}

int return_pointer(vm_val value) {
    type_checker(value, POINTER);
    return value.data;
}

vm_val create_integer(int data) {
    return create_val(data, INTEGER);
}

int return_integer(vm_val value) {
    type_checker(value, INTEGER);
    return value.data;
}

// push 0x03 
// vloz hodnotu na zasobnik
void push(vm_val value) {
    st_check(st->sp);           // kontrola jestli ukazuju jeste na platny 
                                // slot zasobniku - je totiz validni ukazovat
                                // na slot tesne za zasobnikem (abych mohl
                                // provadet pop z posledniho slotu stacku)
    st->start[st->sp] = value;  // na adresu SP dej hodnotu
    st->sp++;
}

// pop 0x04
// vydej hodnotu ze zasobniku
vm_val pop() {
    st_check(st->sp - 1);   // tady se musim podivat o krok zpet
    st->sp--;
    return st->start[st->sp];
}

// dup 0x05
// duplikuje vrchol stacku
void dup() {
    vm_val top = pop();
    push(top);
    push(top);
}

// kontrola pameti (jsem stale v pozadovanem bloku ?)
void mem_check(int base_address, unsigned int offset) {
    
    // na base_address je ulozen size toho objektu
    // protoze je to pole, musi byt offset ostre mensi
    // pokud by byl roven tak uz je to preteceni
    int size = *((int *) (g->mem + base_address));
    if ( size <= offset ) {
        fprintf(stderr, " \e[31mOut of array bounds - %d indexed, but max is %d\e[39m\n", 
                offset, size - 1);
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

    // adresa pole
    int base_address = return_s_pointer(pop());
    
    // pak je tam index
    unsigned int offset = (unsigned int) return_integer(pop());

    // jako prvni se na stack dava 
    // obsah ktery chci ulozit
    vm_val value = pop();
    
    // kontrola indexu pameti
    mem_check(base_address, offset);

    dbg(" 0x%02x:0x%02x (%d) -> M%d+%d", value.type, value.data, value.data, base_address, offset);

    // vem obsah zasobniku a popni ho
    // do pameti - vem obsah
    *((vm_val *) (g->mem + base_address + offset * slot_size + ALLOC_HEADER)) = value;
}

// Continual store ...
// jde o "specialni" instrukci, ktera resi 
// problem s poradim adresa-hodnota na stacku
// (poradi vkladani veci na stack)
// 
// Normalne - treba kdyz se uklada neco do 
// lokalni promenne - se na stack hodi 
// hodnota a pak se provede psl X, kde X
// je ID promenne - tedy poradi je 
// hodnota-adresa. Bohuzel kdyz se inicializuje
// pole a rovnou se do nej prirazuje, je zde
// postup opacny. Je to protoze se na adresu
// ziskanou z alokace dava vice hodnot naraz.
// 
// Aby to bylo mozne, je potreba mit na stacku
// vzdy dvojici adresa-hodnota, na kterou se 
// pousti instrukce store (st) ... ta ale 
// provede na obe polozky vzdy pop - coz sice
// v pripade hodnoty nevadi, ale v pripade
// adresy ano ... je tedy potreba aby adresa
// byla hloubeji na zasobniku a pred kazdym 
// storem se duplikuje (dup) - timto zpusobem
// se tak nalokuje pole, inicializuje se a na
// stacku zustane pouze adresa pole, ktera se
// priradi do promenne, do ktere bylo zapisem
// prirazeno pri alokaci - napr.:
//
//      a = [1,5,6,8]
//
// U ostatnich instrukci je ale jednodusi a 
// obecne i "hezci" postup kdy je adresa davana
// na stack az jako posledni - to napriklad 
// umoznuje ukladat hodnoty do argumentu a 
// promennych tak, ze jejich ID je v bytecodu
// hned za instrukci psa, psl ... neni potreba 
// toto ID predtim push-nout na stack a pak 
// teprve provest jejich ulozeni
//
// Proto je tu instrukce Continual store,
// ktera dela prakticky to same, co store (st)
// ale pocita s tim, ze je ukladano vice veci,
// jejichz pocet je ji dan z bytecodu (za inst.)
//
// Instrukce tak zachova postup hodnota-adresa,
// kdy jako prvni ze stacku provede pop na adresu
// a pak nekolikrat na ni ulozi dle toho kolik
// je podle parametru na stacku polozek ...
// 
// -- Continual Store byl sjednocen s alloc 

// Alokace 0x0c 
// necha naalokovat pole vm_val-u
// a adresu zacatku da na stack
void alloc(vm_val size_v) {

    int size = return_integer(size_v);
    int addr = allocate(g, size);
    dbg(" +M%d", addr);

    char * p = g->mem;

    // zapis delku pole na prvni polozku
    *((int *) p) = size;
    p += sizeof(size);

    vm_val value;
    // na zbytek polozek zapis ty prvky
    for (int i=0; i < size; i++) {
        value = pop();
        // po bytech
        *((vm_val *) p) = value;
        p += slot_size;
    }

    push(create_pointer(addr));
}



// Cteni z pameti 0x0e
void ild() {

    // protoze se muze nechat vypocitat
    // jak obsah tak i index, je potreba
    // vsecho brat pres stack
    
    // adresa pole
    int base_address = return_pointer(pop());
    
    // nejprve je tam index
    unsigned int offset = (unsigned int) return_integer(pop());
    
    // kontrola indexu pameti
    mem_check(base_address, offset);

    // ziskej obsah - skoc na base_address, pricti ALLOC_HEADER, pricti offset 
    vm_val value = *((vm_val *) (g->mem + base_address + ALLOC_HEADER + offset * slot_size));
    dbg(" M%d+%d: 0x%02x:0x%02x (%d))", base_address, offset, value.type, value.data, value.data);

    // proved push ten pameti na stack
    push(value);
}

// ARITMETIKA
// -- 4B operace

// iadd 0x25
void iadd() {
    vm_val op1 = pop();
    vm_val op2 = pop();
    push(create_integer(return_integer(op2) + return_integer(op1)));
}

// isub 0x26
void isub() {
    vm_val op1 = pop();
    vm_val op2 = pop();
    push(create_integer(return_integer(op2) - return_integer(op1)));
}

// imul 0x27
void imul() {
    vm_val op1 = pop();
    vm_val op2 = pop();
    push(create_integer(return_integer(op2) * return_integer(op1)));
}

// idiv 0x28
void idiv() {
    vm_val op1 = pop();
    vm_val op2 = pop();
    push(create_integer(return_integer(op2) / return_integer(op1)));
}

// imod 0x29
void imod() {
    vm_val op1 = pop();
    vm_val op2 = pop();
    push(create_integer(return_integer(op2) % return_integer(op1)));
}

// ineg 0x2a
void ineg() {
    push(create_integer(-return_integer(pop())));
}

// BOOL OPERACE
// -- 4B operace

// ior 0x2b
void ior() {
    vm_val op1 = pop();
    vm_val op2 = pop();
    push(create_boolean(return_boolean(op2) | return_boolean(op1)));
}

// iand 0x2c
void iand() {
    vm_val op1 = pop();
    vm_val op2 = pop();
    push(create_boolean(return_boolean(op2) & return_boolean(op1)));
}

// POROVNAVANI
// -- 4B operace

// ine 0x2f
void ine() {
    vm_val op1 = pop();
    vm_val op2 = pop();
    push(create_boolean(op2.data != op1.data));
}

// igt 0x30
void igt() {
    vm_val op1 = pop();
    vm_val op2 = pop();
    push(create_boolean(return_integer(op2) > return_integer(op1)));
}

// ige 0x31
void ige() {
    vm_val op1 = pop();
    vm_val op2 = pop();
    push(create_boolean(return_integer(op2) >= return_integer(op1)));
}

// ilt 0x32
void ilt() {
    vm_val op1 = pop();
    vm_val op2 = pop();
    push(create_boolean(return_integer(op2) < return_integer(op1)));
}

// ile 0x33
void ile() {
    vm_val op1 = pop();
    vm_val op2 = pop();
    push(create_boolean(return_integer(op2) <= return_integer(op1)));
}

// ieq 0x34
void ieq() {
    vm_val op1 = pop();
    vm_val op2 = pop();
    push(create_boolean(op2.data == op1.data));
}

// RIZENI BEHU PROGRAMU

// jmp 0x11
void jmp(vm_val address) {
    unsigned int adr = (unsigned int) return_s_pointer(address);
    if ( adr >= pr->size) {
        fprintf(stderr, " \e[31m Invalid address %d (0x%02x)\e[39m\n", adr, adr);
        abort();
    }
    pr->ip = adr;
}

// jneq 0x10 
// jump if not equal
void jneq(vm_val address) {
    if (return_boolean(pop()) == 0) jmp(address);
}

// call 0x09
// http://unixwiz.net/techtips/win32-callconv-asm.html
// call od adresy (parametry jsou jiz ulozene na zasobniku !!!)
// POZOR -- FP ukazuje na prvni pole noveho ramce, takze pod nim
// pri volani neni adresa stareho FP - ta je adresu za nim !!! (lepe se to psalo)
void call(vm_val address) {
    // tyto dve instrukce jsou umyslne prohozene, aby se mohlo s 
    // navratovou hodnotou hned pracovat
    push(create_s_pointer(pr->ip));   // vlozi na zasobnik navratovou adresu nasledujici instrukce 
                                        // (+1 protoze ted je ip na instrukci call, ktera prave bezi...)
    push(create_s_pointer(st->fp));   // vlozi na zasobnik stary fp    
    st->fp = st->sp;                    // nastav novy fp
    pr->ip = return_s_pointer(address); // skoc na telo funkce
}

// main ma trochu specialni call, 
// protoze jeho navratova
// adresa je konec souboru
void main_call(vm_val address) {
    push(create_s_pointer(pr->size)); // tady je ten hacek - z mainu se vraci na konec programu
    push(create_s_pointer(st->fp));   // vlozi na zasobnik stary fp    
    st->fp = st->sp;                    // nastav novy fp
    pr->ip = return_s_pointer(address); // skoc na telo mainu
}

// return 0x0a
// navratova hodnota je int a je to posledni udaj na zasobniku
void ret() {
    ret_reg = pop();  // zapis navratovou hodnotu 
    st->sp = st->fp;    // nastav vrchol zasobniku na zacatek ramce
    st->fp = return_s_pointer(pop());   // ziskej stary fp
    pr->ip = return_s_pointer(pop());   // ziskej navratovou adresu
}

// push obsahu ret_regu 0x0b
// je to proto, aby se mohl 
// vycistit zasobnik od parametru
// a nesmazala se zaroven u toho 
// ta navratova hodnota
// http://www.tenouk.com/Bufferoverflowc/Bufferoverflow2a.html
void rer() {
    push(ret_reg);
}

// pop stack to locale 0x1d
// locals jsou cislovane od 0
void psl(vm_val offset_v) {
    unsigned int offset = (unsigned int) return_s_pointer(offset_v);
    st_check(st->fp + offset);
    vm_val value = pop();                    // tady mne nezajima co to je
    dbg(" 0x%02x -> L%d", value.data, offset);
    st->start[st->fp + offset] = value;
}

// push locale on stack 0x1e
// locals jsou cislovane od 0
void pls(vm_val offset_v) {
    unsigned int offset = (unsigned int) return_s_pointer(offset_v);
    st_check(st->fp + offset);
    push(st->start[st->fp + offset]);
}

// pop stack to argument 0x2d
// argumenty jsou cislovane od 0
void psa(vm_val offset_v) {
    unsigned int offset = (unsigned int) return_s_pointer(offset_v);
    // krok pres stare FP, pres IP, 
    // a na zacatek parametru
    int stepback = 3;
    st_check(st->fp - offset - stepback);  
    vm_val value = pop();                    // tady mne nezajima co to je
    dbg(" 0x%02x -> A%d", value.data, offset);
    st->start[st->fp - offset - stepback] = value;
}

// push argument to stack 0x2e
// argumenty jsou cislovane od 0
void pas(vm_val offset_v) {
    unsigned int offset = (unsigned int) return_s_pointer(offset_v);
    // krok pres stare FP, pres IP, 
    // na zacatek parametru
    int stepback = 3;
    st_check(st->fp - offset - stepback); 
    push(st->start[st->fp - offset - stepback]);
}

// control output 0x12
void out() {
    vm_val value = pop(); 
    printf("0x%02x (%d)", value.data, value.data);
    fprintf(output_file, "%d\n", value.data);
}
