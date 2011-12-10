#include "definitions.h"

void dbg_on();
void dbg_mute();

//====================
// VM_VALUE GET/SET 
//====================

// universal type dispatcher
vm_val create_value(char * bytes, char type);

// typed setters/getters

vm_val create_boolean(char data);

char return_boolean(vm_val value);

vm_val create_slot_id(unsigned int data); 

unsigned int return_slot_id(vm_val value); 

vm_val create_i_pointer(unsigned int data);

unsigned int return_i_pointer(vm_val value); 

vm_val create_s_pointer(vm_val * data);

vm_val * return_s_pointer(vm_val value);

vm_val create_pointer(vm_val * data);

vm_val * return_pointer(vm_val value);

vm_val create_integer(int data);

int return_integer(vm_val value);

//====================
// BYTECODE instrukce
//====================

// Alokace 0x0c
// necha naalokovat pole int-u
// a adresu zacatku da na stack
void alloc(vm_val size);

// Ulozeni do pameti 0x0d
// ten base address je tam proto, 
// abych dokazal rict, zda je po 
// aplikaci offsetu adresa jeste 
// stale patrici k tomu puvodnimu
// kusu pameti nebo uz jsem mimo
void ist();

// Cteni z pameti 0x0e
void ild(); 
 
// dup 0x05
// duplikuje vrchol stacku
void dup();

// push 0x03 
// vloz 4B hodnotu na zasobnik
void push(vm_val value);

// pop 0x04
// vydej 4B hodnotu ze zasobniku
vm_val pop();

// ARITMETIKA
// -- 4B operace

// iadd 0x25
void iadd();

// isub 0x26
void isub();

// imul 0x27
void imul();

// idiv 0x28
void idiv();

// imod 0x29
void imod();

// ineg 0x2a
void ineg();

// BOOL OPERACE
// -- 4B operace

// ior 0x2b
void ior();

// iand 0x2c
void iand();

// POROVNAVANI
// -- 4B operace

// ine 0x2f
void ine();

// igt 0x30
void igt();

// ige 0x31
void ige();

// ilt 0x32
void ilt();

// ile 0x33
void ile();

// ieq 0x34
void ieq();

// RIZENI BEHU PROGRAMU

// jmp 0x11
void jmp(vm_val address); 

// jneq 0x10 
// jump if not equal
void jneq(vm_val address);

// call 0x09
// http://unixwiz.net/techtips/win32-callconv-asm.html
// call od adresy (parametry jsou jiz ulozene na zasobniku !!!)
// POZOR -- FP ukazuje na prvni pole noveho ramce, takze pod nim
// pri volani neni adresa stareho FP - ta je adresu za nim !!! (lepe se to psalo)
void call(vm_val address);

// main ma trochu specialni call, 
// protoze jeho navratova
// adresa je konec souboru
void main_call(vm_val address);

// return 0x0a
// navratova hodnota je int a je to posledni udaj na zasobniku
void ret();

// push obsahu ret_regu 0x0b
// je to proto, aby se mohl 
// vycistit zasobnik od parametru
// a nesmazala se zaroven u toho 
// ta navratova hodnota
void rer();

// pop stack to locale 4B 0x1d
// locals jsou cislovane od 0
void psl(vm_val offset_v);

// push locale on stack 4B 0x1e
// locals jsou cislovane od 0
void pls(vm_val offset_v);

// pop stack to argument 4B 0x2d
// argumenty jsou cislovane od 0
void psa(vm_val offset_v);

// push argument to stack 4B 0x2e
// argumenty jsou cislovane od 0
void pas(vm_val offset_v);

// control output 0x12
void out();
