#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <strings.h>
#include <assert.h>
#include <stdio.h>

#include "bytecode.h"


//void dbg_on() { verbose = 0x01; }
//void dbg_mute() { verbose = 0x00; }

//====================
// BYTECODE instrukce
//====================

void type_checker(vm_val value, vm_val_type type) {
    
    if ( value.head.type != type) {
        fprintf(stderr, " \e[31mRuntime exception: bad data type 0x%02x != 0x%02x\e[39m\n", 
                value.head.type, type);
        abort();
    }

}

void st_check(vm_val * address) {
    
    if ( address > st->start + st->slots - 1 ) {
        fprintf(stderr, " \e[31mStack overflow\e[39m\n");
        abort();
    }
    
    if ( address < st->start ) {
        fprintf(stderr, " \e[31mStack underflow\e[39m\n");
        abort();
    }
}

vm_val create_value(char * bytes, char type) {
    switch (type) {
    case INTEGER:
        return create_integer(*(int *) bytes);
    case BOOLEAN:
        return create_boolean(*(char *) bytes);
    case NIL:
        return create_nil();
    case CHARACTER:
        return create_character(*(unsigned int *) bytes);
    default:
        fprintf(stderr, " \e[31mUknown value type\e[39m\n");
        abort();
    }
}

vm_val create_nil() {
    vm_val value; 
    value.head.type = NIL;
    value.body.it = 0x00;   // pro uplnost
    return value;
}

// NIL nema vnitrni implementaci - je to proste NIL

vm_val create_fd(FILE * data) {
    vm_val value; 
    value.head.type = FILE_DESC;
    value.body.fd = data;
    return value;
}

FILE * return_fd(vm_val value) {
    type_checker(value, FILE_DESC);
    return value.body.fd;
}

vm_val create_character(unsigned int data) {
    vm_val value; 
    value.head.type = CHARACTER;
    value.body.it = data;
    return value;
}

unsigned int return_character(vm_val value) {
    type_checker(value, CHARACTER);
    return value.body.it;
}

vm_val create_boolean(int data) {
    vm_val value; 
    value.head.type = BOOLEAN;
    value.body.it = data;
    return value;
}

int return_boolean(vm_val value) {
    type_checker(value, BOOLEAN);
    return value.body.it;
}

vm_val create_slot_id(unsigned int data) {
    vm_val value; 
    value.head.type = SLOT_ID;
    value.body.sl = data;
    return value;
}

unsigned int return_slot_id(vm_val value) {
    type_checker(value, SLOT_ID);
    return value.body.sl;
}

vm_val create_i_pointer(unsigned int data) {
    vm_val value; 
    value.head.type = I_POINTER;
    value.body.ip = data;
    return value;
}

unsigned int return_i_pointer(vm_val value) {
    type_checker(value, I_POINTER);
    return value.body.ip;
}

vm_val create_s_pointer(vm_val * data) {
    vm_val value; 
    value.head.type = S_POINTER;
    value.body.pt = data;
    return value;
}

vm_val * return_s_pointer(vm_val value) {
    type_checker(value, S_POINTER);
    return value.body.pt;
}

vm_val create_pointer(vm_val * data) {
    vm_val value; 
    value.head.type = POINTER;
    value.body.rf = data;
    return value;
}

vm_val * return_pointer(vm_val value) {
    type_checker(value, POINTER);
    return value.body.rf;
}

vm_val create_integer(int data) {
    vm_val value; 
    value.head.type = INTEGER;
    value.body.it = data;
    return value;
}

int return_integer(vm_val value) {
    type_checker(value, INTEGER);
    return value.body.it;
}

// push 0x03 
// vloz hodnotu na zasobnik
void push(vm_val value) {
    st_check(st->sp);   // kontrola jestli ukazuju jeste na platny 
                        // slot zasobniku - je totiz validni ukazovat
                        // na slot tesne za zasobnikem (abych mohl
                        // provadet pop z posledniho slotu stacku)
    *(st->sp) = value;  // na adresu SP dej hodnotu
    st->sp++;
}

// pop 0x04
// vydej hodnotu ze zasobniku
vm_val pop() {
    st_check(st->sp - 1);   // tady se musim podivat o krok zpet
    st->sp--;
    return *(st->sp);
}

// dup 0x05
// duplikuje vrchol stacku
void dup() {
    vm_val top = pop();
    push(top);
    push(top);
}

// kontrola pameti (jsem stale v pozadovanem bloku ?)
void mem_check(vm_val * base_address, unsigned int offset) {
    
    // je to vubec pole ?
    if (base_address->head.type != ARRAY_SIZE) {
        fprintf(stderr, " \e[31mInvalid address - missing element size info\e[39m\n");
        abort();
    }

    // na base_address je ulozen size toho objektu
    // protoze je to pole, musi byt offset ostre mensi
    // pokud by byl roven tak uz je to preteceni
    int size = base_address->body.sz;
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
    vm_val * base_address = return_pointer(pop());

    // pak je tam index
    unsigned int offset = (unsigned int) return_integer(pop());

    // jako prvni se na stack dava 
    // obsah ktery chci ulozit
    vm_val value = pop();
    
    // kontrola indexu pameti
    mem_check(base_address, offset);

    dbg(" 0x%02x:0x%02x (%d) -> M%d+%d", 
            value.head.type, 
            value.body.it, 
            value.body.it, 
            ((int) base_address - (int) g->mem) / sizeof(vm_val), 
            offset);

    // vem obsah zasobniku a popni ho
    // do pameti - vem obsah
    // +1 preskoc udaj o size
    base_address[offset + 1] = value; 
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
    vm_val * addr = allocate(size);
    dbg(" +M%d", ((int) addr - (int) g->mem) / sizeof(vm_val));

    // zapis delku pole na prvni polozku
    addr->head.type = ARRAY_SIZE;
    addr->body.sz = size;

    // na zbytek polozek zapis ty prvky
    for (int i=0; i < size; i++) {
        addr[i + 1] = pop();
    }

    push(create_pointer(addr));
}

// Clean allocation 0x1c 
void clalloc() {

    int size = return_integer(pop());
    vm_val * addr = allocate(size);
    dbg(" +M%d", ((int) addr - (int) g->mem) / sizeof(vm_val));

    // zapis delku pole na prvni polozku
    addr->head.type = ARRAY_SIZE;
    addr->body.sz = size;

    // na zbytek polozek zapis nil
    for (int i=0; i < size; i++) {
        addr[i + 1] = create_nil();
    }

    push(create_pointer(addr));
}

// size of memory object
void szof() {

    vm_val * addr = return_pointer(pop());
    mem_check(addr,0);
    int size = addr->body.sz;
    dbg(" |M%d| = %d", ((int) addr - (int) g->mem) / sizeof(vm_val), size);
    push(create_integer(size));

}

// Cteni z pameti 0x0e
void ild() {

    // protoze se muze nechat vypocitat
    // jak obsah tak i index, je potreba
    // vsecho brat pres stack
    
    // adresa pole
    vm_val * base_address = return_pointer(pop());
    
    // nejprve je tam index
    unsigned int offset = (unsigned int) return_integer(pop());
    
    // kontrola indexu pameti
    mem_check(base_address, offset);

    // ziskej obsah - skoc na base_address, pricti 1, pricti offset 
    vm_val value = base_address[offset + 1];
    dbg(" M%d+%d: 0x%02x:0x%02x (%d)", 
            ((int) base_address - (int) g->mem) / sizeof(vm_val), 
            offset, 
            value.head.type, 
            value.body.it, 
            value.body.it);

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

// not 0x17
void inot() {
    vm_val op = pop();
    push(create_boolean(return_boolean(op) == 1 ? 0 : 1));
}

// POROVNAVANI
// -- 4B operace

// ine 0x2f
void ine() {
    vm_val op1 = pop();
    vm_val op2 = pop();
    push(create_boolean(op2.body.it != op1.body.it));
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
    if (op1.head.type == NIL && op2.head.type == NIL)
        push(create_boolean(1));
    push(create_boolean(op2.body.it == op1.body.it));
}

// RIZENI BEHU PROGRAMU

// jmp 0x11
void jmp(vm_val address) {
    unsigned int adr = return_i_pointer(address);
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

// jeq 0x0f 
// jump if equal
void jeq(vm_val address) {
    if (return_boolean(pop()) == 1) jmp(address);
}

// call 0x09
// http://unixwiz.net/techtips/win32-callconv-asm.html
// call od adresy (parametry jsou jiz ulozene na zasobniku !!!)
// POZOR -- FP ukazuje na prvni pole noveho ramce, takze pod nim
// pri volani neni adresa stareho FP - ta je adresu za nim !!! (lepe se to psalo)
void call(vm_val address) {
    // tyto dve instrukce jsou umyslne prohozene, aby se mohlo s 
    // navratovou hodnotou hned pracovat
    push(create_i_pointer(pr->ip));   // vlozi na zasobnik navratovou adresu nasledujici instrukce 
                                      // (+1 protoze ted je ip na instrukci call, ktera prave bezi...)
    push(create_s_pointer(st->fp));   // vlozi na zasobnik stary fp    
    st->fp = st->sp;                    // nastav novy fp
    pr->ip = return_i_pointer(address); // skoc na telo funkce
}

// main ma trochu specialni call, 
// protoze jeho navratova
// adresa je konec souboru
void main_call(vm_val address) {
    push(create_i_pointer(pr->size)); // tady je ten hacek - z mainu se vraci na konec programu
    push(create_s_pointer(st->fp));   // vlozi na zasobnik stary fp    
    st->fp = st->sp;                    // nastav novy fp
    pr->ip = return_i_pointer(address); // skoc na telo mainu
}

// return 0x0a
// navratova hodnota je int a je to posledni udaj na zasobniku
void ret() {
    ret_reg = pop();    // zapis navratovou hodnotu 
    st->sp = st->fp;    // nastav vrchol zasobniku na zacatek ramce
    st->fp = return_s_pointer(pop());   // ziskej stary fp
    pr->ip = return_i_pointer(pop());   // ziskej navratovou adresu
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
void psl(vm_val slot_val) {
    unsigned int slot = return_slot_id(slot_val);
    st_check(st->fp + slot);
    vm_val value = pop();                    // tady mne nezajima co to je
    dbg(" 0x%02x -> L%d", value.body.it, slot);
    st->fp[slot] = value;
}

// push locale on stack 0x1e
// locals jsou cislovane od 0
void pls(vm_val slot_val) {
    unsigned int slot = return_slot_id(slot_val);
    st_check(st->fp + slot);
    push(st->fp[slot]);
}

// pop stack to argument 0x2d
// argumenty jsou cislovane od 0
void psa(vm_val slot_val) {
    unsigned int slot = return_slot_id(slot_val);
    // krok pres stare FP, pres IP, 
    // a na zacatek parametru
    int stepback = 3;
    st_check(st->fp - slot - stepback);  
    vm_val value = pop();                    // tady mne nezajima co to je
    dbg(" 0x%02x -> A%d", value.body.it, slot);
    *(st->fp - slot - stepback) = value;
}

// push argument to stack 0x2e
// argumenty jsou cislovane od 0
void pas(vm_val slot_val) {
    unsigned int slot = return_slot_id(slot_val);
    // krok pres stare FP, pres IP, 
    // na zacatek parametru
    int stepback = 3;
    st_check(st->fp - slot - stepback); 
    push(*(st->fp - slot - stepback));
}

// printer
void print(vm_val value, int level) {

    // odsazeni
    for (int i=0; i < level; i++) {
        printf("  ");
    }

    switch (value.head.type) {
    case BOOLEAN:
        printf("(BOOLEAN: \"%s\")\n", value.body.it == 1 ? "true" : "false");
        break;
    case CHARACTER:
        printf("(CHARACTER: '%c' (%d))\n", value.body.it, value.body.it);
        break;
    case NIL:
        printf("(NIL)\n"); 
        break;
    case INTEGER:
        printf("(INTEGER: 0x%02x (%d))\n", value.body.it, value.body.it);
        break;
    case POINTER:
        printf("(POINTER: %p):\n", value.body.rf);
        vm_val * target = return_pointer(value);
        for (int i=1; i <= target->body.sz; i++) {
            print(target[i],level+1);
        }
        break;
    default:
        printf("(--SYSTEM-- 0x%02x)\n", value.head.type); 
        break;
    }
}

// control output 0x12
void out() {
    vm_val value = pop(); 
    dbg("\n");
    printf("\n\e[32m");
    print(value,1);
    printf("\e[0m");
    //fprintf(output_file, "%d\n", value.body.it);
}

// file open
void fo() {      

    // nejprve si vem ten mod
    unsigned int mode = (unsigned int) return_integer(pop());
      
    char * open_mode;

    switch (mode) {
    case 0: open_mode = "r"; break;
    case 1: open_mode = "w"; break;
    case 2: open_mode = "a"; break;
    case 3: open_mode = "r+"; break;
    case 4: open_mode = "w+"; break;
    case 5: open_mode = "a+"; break;
    default:
            fprintf(stderr, " \e[31m Invalid file open mode \e[39m\n");
            abort();
    }

    // je volny nejaky FD
    if ( free_fds <= 0) {
        fprintf(stderr, " \e[31m Out of file descriptors \e[39m\n");
        abort();
    }
    
    // na stacku by mela byt adresa 
    // do pameti, kde je ulozeny
    // nazev souboru, co se ma 
    // otevrit
    vm_val * file_name_mem_adr = return_pointer(pop());

    // kontrola pole
    mem_check(file_name_mem_adr, 0);

    // kolik je znaku toho nazvu 
    int name_size = file_name_mem_adr->body.sz;

    // do fopen se ten nazev musi dat jako
    // pole charu, takze to musim nahazet
    // na zasobnik a prevest do pouzitelne
    // podoby
    //
    // TODO ... no, melo - ja to ted pro 
    // rychlost davam do samostatne pameti 
    // (to by ve finale byt nemelo ...)
    // Mohlo by tady totiz dochazet k memory
    // leakum kdyz by nekdo vytvoril ku**vsky
    // dlouhy text, tak by si ho giraffe naalo-
    // koval uplne mimo bariery HEAP a STACK size
    char * filename = (char*) malloc(sizeof(char) * name_size);
    int i;
    for (i=0; i < name_size; i++) {         
        // 1 + i ... musim preskakovat ten udaj o delce 
        filename[i] = (char) return_character(file_name_mem_adr[1+i]);
    }

    // a \0
    filename[i] = '\0';

    dbg("Opening file: '%s'",filename);

    // ziskany FD dej do pole
    fds[free_fds-1] = fopen(filename,open_mode);

    if (fds[free_fds-1] == NULL) {        
        dbg(" ... failed");
        push(create_nil()); // pokud se nezdarilo otevreni, tak dej jako vysledek nil
        return;
    }

    free_fds--;     // sniz pocet volnych FD

    // TODO uvolni ten pomocny kus pameti
    free(filename);

    dbg(" FD: %p", fds[free_fds]);

    // uloz na stack FD
    push(create_fd(fds[free_fds]));
}

// read number 0x14
void rn() {

    // na zasobniku by mel byt ulozeny FD 
    FILE * fd = return_fd(pop());

    int number;
    if (fscanf(fd, "%d", &number) > 0 ) {
        dbg("From file on FD %p i've read number %d",fd,number);
        push(create_integer(number));
    } else {
        dbg(" ... failed");
        push(create_nil()); // pokud se nezdarilo otevreni, tak dej jako vysledek nil
        return;
    }
}

int write(int convert_output, FILE * fd, char output[]) {

    int write_output = fwrite(output, 1, strlen(output), fd);
    if (convert_output > 0 && write_output == strlen(output)) {
        dbg("I've written in file %p value %s",fd,output);
        return 1;
    } else {
        dbg(" ... failed");
        return -1;
    }
}

int innerwrite(vm_val value, FILE * fd, char output[]) {

    int convert_output;
    vm_val * target;
    switch (value.head.type) {
    case BOOLEAN:
        convert_output = sprintf(output, "%c", value.body.bl);
        return write(convert_output, fd, output);
        break;
    case INTEGER:
        convert_output = sprintf(output, "%d", value.body.it);
        return write(convert_output, fd, output);
        break;
    case CHARACTER:
        convert_output = sprintf(output, "%c", value.body.it);
        return write(convert_output, fd, output);
        break;
    case NIL:
        push(create_boolean(1)); // vse je ok
        return 1;
    case POINTER:
        target = return_pointer(value);
        for (int i=1; i <= target->body.sz; i++) {
            if (innerwrite(target[i], fd, output) < 0) return -1;
        }
        return 1;
    default:
        fprintf(stderr, " \e[31m Invalid value during file write \e[39m\n");
        abort();
        break;    
    }


}

// write in file 0x16
void wf() {

    // na zasobniku by mel byt ulozeny FD 
    FILE * fd = return_fd(pop());

    // co tam chci ulozit ?
    vm_val value = pop();

    char output[100];

    if (innerwrite(value, fd, output) < 0 ) {
        push(create_nil()); // pokud se nezdaril zapis, tak dej jako vysledek nil
    } else {
        push(create_boolean(1)); // vse je ok
    }
}

// close file
void fc() {

    // na zasobniku by mel byt ulozeny FD 
    FILE * fd = return_fd(pop());

    dbg("Closing file on FD %p",fd);
    fclose(fd);
}


