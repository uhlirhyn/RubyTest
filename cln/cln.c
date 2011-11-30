#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <strings.h>
#include <assert.h>
#include <stdio.h>

// Bytecode interpret

#define HEAP_SIZE 1024  // 1 KB
#define STACK_SIZE 1024 // 1 KB
#define BUFFER 128

#define test(t) { assert(t); printf("\e[1m\e[32m|\e[0m"); }

// VM globals
struct program * pr;    // program
struct stack * st;      // zasobnik
struct gc * g;          // pamet (GC)

typedef struct stack {
    char * start;       // Zacatek stacku
    char * sp;          // Stack pointer - ukazuje na prazdne pole
    char * fp;          // Frame pointer - zacatek ramce, ukazuje na prvni pole ramce
} stack;

typedef struct program {
    char * filename;        // jmeno souboru
    char * bytes;           // instrukce (nacteny soubor)
    int size;               // velikost souboru
    int ip;                 // aktualni instrukce (index BC) ktera se ma provest
} program;

// Sum: 16 B
typedef struct obj {
    int mark;           // 4 B
    struct obj * class; // 4 B
    int size;           // 4 B
    union {             // 4 B
        char * bytes;           // na data se dá nahlížet jako na pole znaků
        struct obj ** fields;   // nebo jako na pole vlastností objektu
    } data;
} obj; 

// Abych nemusel alokovat celou tabulku pro 
// polozky listu, mohl bych volne sloty pameti
// pouzit rovnou jako ty polozky - gc by tak
// mel pouze prvni polozku a zbytek by byl ulozen
// v te pameti ... 

// Sum: 8 B
typedef struct freelist {
    int size;                   // kolik toho mista je (v objektech)
    struct freelist * next;     // dalsi polozka listu
} freelist;

// Garbage Collector
typedef struct gc {
    obj * mem;
    obj * old;
    int real_size;
    struct freelist * list;   
} gc;

// promenna 
typedef struct var {
    char * id;
    obj * value;
} var;

// prostredi
typedef struct env {
    int size;               // kolik je velikost env (vars) ?
    var * vars;             // odkaz na pole promennych
    struct env * prev;      // predchozi env
} env;

void scavenge(gc * gcl) {

    //....

}

// http://www.anyexample.com/programming/c/how_to_load_file_into_memory_using_plain_ansi_c_language.xml
int load_file(const char *filename, char **result) { 
    
    int size = 0;
    FILE * f = fopen(filename, "rb");

    if (f == NULL) { 
        *result = NULL;
        return -1;      // -1 means file opening fail 
    } 

    fseek(f, 0, SEEK_END);
    size = ftell(f);
    fseek(f, 0, SEEK_SET);
    *result = (char *) malloc(size + 1);
    
    if (size != fread( *result, sizeof(char), size, f)) { 
        free(*result);
        return -2;      // -2 means file reading fail 
    } 
    
    fclose(f);
    (*result)[size] = 0;
    return size;
}

// vynuluje ciselniky apod. - vyresetuje VM
void reset_vm() {

    //==========
    //    GC
    //==========

    // vynuluj pamet
    bzero((void*) g->mem, g->real_size);
    bzero((void*) g->old, g->real_size);

    // zalozeni freelistu;
    g->list = (freelist *) g->mem;
    g->list->size = g->real_size;
    g->list->next = NULL;

    //==========
    //  STACK
    //==========
    
    st->sp = st->start;
    st->fp = st->start;

    //===========
    //  PROGRAM
    //===========
    
    pr->ip = 0;
}

void init() {

    //==========
    //    GC
    //==========

    // alokace meho pametoveho prostoru
    g->real_size = HEAP_SIZE / 2;
    g->mem = (obj *) malloc(g->real_size);
    
    // oldspace
    g->old = (obj *) malloc(g->real_size);

    //==========
    //  STACK
    //==========

    st->start = malloc(STACK_SIZE);

    //===========
    //  PROGRAM
    //===========
    
    pr->size = load_file(pr->filename, &pr->bytes);
    if (pr->size < 0) { 
        puts("\e[31mError loading file\e[0m");
        abort();
    } 

    reset_vm();

}

void mem_dump(gc * gcl, int grouping) {

    char * mem = (char*) gcl->mem;

    printf("----------------------------------------\n");
    printf("  HEAP DUMP \n");
    printf("----------------------------------------\n");

    int i=0; 
    while (i < gcl->real_size / sizeof(char)) {
        printf("%p:", mem+i);
        for (int j=0; j < grouping; j++) {
            printf("\t%X ",*(mem + i++));
            if (i > gcl->real_size/sizeof(char)) break;
        }
        printf("\n");
    }

}

void print_freelist(gc * gcl) {

    printf("----------------------------------------\n");
    printf("  FREE LIST \n");
    printf("----------------------------------------\n");

    freelist * next = gcl->list;

    while(next != NULL) {

        printf("Address: %p, %d B, next freespace on %p\n",
                next, next->size, next->next);

        next = next->next;
    }
}

// alokuj v GC pameti 
// gc - garbage collector
// size - pozadovana velikost v bytech
void * allocate(gc * gcl, int size) {  

    freelist * next = gcl->list;

    // najdi takovou velikost volneho prostoru kam by se tohle veslo
    while(next != NULL) {

        // pokud jsem nasel dost velke misto, 
        // uprav freelist a vrat na nej referenci
        if (next->size >= size) {

            // pokud za alokovanym mistem neni uz zadny
            // freespace (vyslo to presne) nebo tam neni 
            // misto na udaj o dalsim volnem miste (tedy
            // freespace o velikosti freelist struktury,
            // pak nezmensuj ale rovnou preskoc na dalsi 
            // polozku o volnem miste
            if (next->size - size < sizeof(freelist)) { 

                gcl->list = next->next;

            } else {

                // posuv sice probiha jiz pred tim, nez
                // muze na alokovane misto dojit k zapisu,
                // bohuzel, informaci o next si muze prepsat
                // sam freelist, protoze se muze posunout tak,
                // ze na misto stareho next, prijde nove size
                // polozce size takove nebezpeci nehrozi, protoze
                // se zapisuje jako prvni
                freelist * old_next = next->next;

                // je tam jeste kus mista,
                // odecti ho a zaloz "uprav"
                // polozku freelistu                                             
                gcl->list = (freelist *) ((void *) next + size);    // posuv
                printf("oldsize: %d size:%d\n", next->size, size);
                gcl->list->size = next->size - size;    // zmensi jeho velikost
                printf("freesize %d\n", gcl->list->size);
                gcl->list->next = old_next;           // naslednik je stejny
            }
        
            return next;

        } else {    
            // jinak pokracuj dal
            printf("\t%d can't fit into %d\n", size, next->size);
            next = next->next;
        }
    }

    // doslo misto nenasel jsem dost velky kus- next == NULL
    // scavenge()
    printf("Out of heap ... collecting garbage (***TODO***)\n");
    
    fprintf(stderr, " \e[31mOut of memory ...\e[39m\n");
    abort();

}

// Pri vytvyreni stringu se naalokuje misto pro tento retezec,
// pokud se pak String zmeni, vraci se nova instance (neslo by
// jen tak najednou protahnout to pole char-u) - to je taky duvod
// proc je pridavani do stringu tak neefektivni a proc java ma
// implementovan StringBuilder
char * new_str(gc * gcl, char * str) {

    // alokuj novou pamet pro string
    // strlen je potreba zvestit o 1 protoze se zapisuje
    // sice jenom (napriklad) jeden znak ale jeste se zapisuje \0
    char * s = (char *) allocate(gcl, strlen(str) + 1);

    // kopiruje stylem cil-zdroj
    strcpy( s, str );
    return s;
}

// console mark
void cm() {
    printf("giraffe > ");
}

int read_str(char * text) {

    if ( scanf("%s", text) != 0 ) {
        
        // search for newline character
        char *newline = strchr(text, '\n'); 
        if ( newline != NULL )
            *newline = '\0'; // overwrite trailing newline
    }

    return strlen(text);

}

int read_number(int * number) {

    if ( scanf("%d", number) != 0 ) {
        return 1;
    }

    return 0;

}

void store_number(obj * o, int value) {

    *((int *) o) = value;

}

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

// add_char 0x05
// secti 4B hodnoty
void iadd() {
    int op1 = pop_i();
    int op2 = pop_i();
    push_i(op1 + op2);
}

// iadd 0x25
// secti 1B hodnoty
void add_c() {
    char op1 = pop();
    char op2 = pop();
    push(op1 + op2);
}

// sub_char 0x06
// odecti 1B hodnoty
void sub_c() {
    char op1 = pop();
    char op2 = pop();
    push(op1 - op2);
}

// jmp 0x11
void jmp(unsigned int offset) {
    int adr = pr->ip + offset;
    if ( adr >= pr->size) {
        fprintf(stderr, " \e[31m Invalid address %d\e[39m\n", adr);
        abort();
    }
}

// jeq 0x10 
// jump if equal
void jeq(unsigned int offset) {
    if (pop() == 0) jmp(offset);
}

// call 0x09
// http://unixwiz.net/techtips/win32-callconv-asm.html
// call od adresy (parametry jsou jiz ulozene na zasobniku !!!)
// POZOR -- FP ukazuje na prvni pole noveho ramce, takze pod nim
// pri volani neni adresa stareho FP - ta je adresu za nim !!! (lepe se to psalo)
void call(int address) {
    // tyto dve instrukce jsou umyslne prohozene, aby se mohlo s 
    // navratovou hodnotou hned pracovat
    push_i(0);          // udela se misto pro navratovou hodnotu
    push_i(pr->ip + 5); // vlozi na zasobnik navratovou adresu 4B adresa callu + 1B opcode "call"
                        // (+1 protoze ted je ip na instrukci call, ktera prave bezi...)
    push_p(st->fp);     // vlozi na zasobnik stary fp    
    st->fp = st->sp;    // nastav novy fp
    pr->ip = address;   // skoc na telo funkce
}

// return 0x0a
// navratova hodnota je int a je to posledni udaj na zasobniku
void ret() {
    // musi se vratit o velikost navratove hodnoty + preskocit ret adresu
    *(st->fp - 2 * sizeof(int)) = pop_i();    // zapis navratovou hodnotu 
    st->sp = st->fp;    // nastav vrchol zasobniku na zacatek ramce
    st->fp = pop_p();   // ziskej stary fp
    pr->ip = pop_i();   // ziskej navratovou adresu
}

// pop stack to locale 4B 0x1d
// locals jsou cislovane od 0
void ipsl(unsigned int offset) {
    st_check(st->fp + offset * 4);
    *(st->fp + offset * 4) = pop_i();
}

// push locale on stack 4B 0x1e
// locals jsou cislovane od 0
void ipls(unsigned int offset) {
    st_check(st->fp + offset * 4);
    push_i(*(st->fp + offset * 4));
}

// pop stack to locale 1B 0x1b
// locals jsou cislovane od 0
void psl_c(unsigned int offset) {
    st_check(st->fp + offset);
    *(st->fp + offset) = pop();
}

// push locale on stack 1B 0x1c
// locals jsou cislovane od 0
void pls_c(unsigned int offset) {
    st_check(st->fp + offset);
    push(*(st->fp + offset));
}

// store locale 1B 0x0b
// locals jsou cislovane od 0
void sl_c(char value, unsigned int offset) {
    st_check(st->fp + offset);
    *(st->fp + offset) = value;
}

// load locale 1B 0x0c
// locals jsou cislovane od 0
char ll_c(unsigned int offset) {
    st_check(st->fp + offset);
    return *(st->fp + offset);
}

// store in arguments 4B 0x2d
// argumenty jsou cislovane od 0
void sa(unsigned int offset) {
    // krok zpet, krok pres stare FP (4B), pres IP (4B) a return value (4B)
    // offset je ted 4x vetsi (int)
    int stepback = 1 + 3 * sizeof(char *);
    st_check(st->fp - offset * 4 - stepback);  
    *(st->fp - offset * 4 - stepback) = pop_i();
}

// load from arguments 4B 0x2e
// argumenty jsou cislovane od 0
void la(unsigned int offset) {
    // krok zpet, krok pres stare FP (4B), pres IP (4B) a return value (4B)
    // offset je ted 4x vetsi (int)
    int stepback = 1 + 3 * sizeof(char *);
    st_check(st->fp - offset * 4 - stepback); 
    push_i(*(st->fp - offset * 4 - stepback));
}

// store in arguments 1B 0x0d
// argumenty jsou cislovane od 0
void sa_c(char value, unsigned int offset) {
    // krok zpet, krok pres stare FP (4B), pres IP (4B) a return value (4B)
    int stepback = 1 + 3 * sizeof(char *);
    st_check(st->fp - offset - stepback);  
    *(st->fp - offset - stepback) = value;
}

// load from arguments 1B 0x0e
// argumenty jsou cislovane od 0
char la_c(unsigned int offset) {
    // krok zpet, krok pres stare FP (4B), pres IP (4B) a return value (4B)
    int stepback = 1 + 3 * sizeof(char *);
    st_check(st->fp - offset - stepback); 
    return *(st->fp - offset - stepback);
}

// control output 0x0e
void out_c() {
    printf("%x", pop());
}

//===============
// VM EXECUTION
//===============

// vezme dalsi byte z bytecodu
char next() {
    return pr->bytes[pr->ip++];
}

// http://www.cprogramming.com/tutorial/cfileio.html
// http://www.ibm.com/developerworks/ibm/library/it-haggar_bytecode/
void run() {

    char opcode;
    char pc;
    int pi;
    char pa[4];

    // skoc na "main"
    // prvni int v souboru je adresa mainu
    pa[3] = next();
    pa[2] = next();
    pa[1] = next();
    pa[0] = next();
    pi = *((int *) pa);
    pr->ip = pi;

    printf(" Header 4B: \e[33m-- Main found on %d (0x%02x)\e[0m\n", pi, pi);

    // provadej instrukce
    while (pr->ip < pr->size) {

        opcode = next();
        printf(" Byte: 0x%02x ", opcode);

        switch (opcode) {
        case 0x01:
            printf("\e[36m-- push \e[0m");
            pc = next();
            printf("\e[36m%c (0x%02x)\e[0m",pc ,pc);
            push(pc);
            break;
        case 0x0a:
            printf("\e[36m-- ret \e[0m");
            ret();
            break;
        case 0x02:
            printf("\e[36m-- pop \e[0m");
            pop();
            break;
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
        case 0x00:
            printf("\e[36m-- nop\e[0m");
            break;
        case 0x0f:
            printf("\e[36m-- out_c\e[0m");
            out_c();
            break;
        default:
            printf("\e[33m-- WARNING: Uknown opcode 0x%02x (ignored)\e[0m", opcode);
        }

        printf("\n");
    }

}

int main ( int argc, char **argv ) {

    // zaloz GC a alokuj pamet
    // zaloz stack
    gc gcl;
    stack stk;
    program prg;
    
    g = &gcl;
    st = &stk;
    pr = &prg;

    // TODO kontrola existence parametru
    pr->filename = argv[1];

    init();

    printf("----------------------------------------\n");
    printf(" Giraffe !\n----------------------------------------\n");

    printf(" Mem loc.:\t%p - %p\n",g->mem, g->mem + g->real_size);
    printf(" Mem size:\t%d B\n",g->real_size);
    printf(" Stack loc.:\t%p - %p\n",st->start, st->start + STACK_SIZE);
    printf(" Stack size:\t%d B\n",STACK_SIZE);

    printf("----------------------------------------\n");

    // BYTECODE test ... 
    printf(" Tests: ");
  
    // push / pop
    push(15);
    test(pop() == 15);
    
    // add_char
    push(11);
    push(12);
    add_c();
    test(pop() == 23);

    // sub_char
    push(11);
    push(12);
    sub_c();
    test(pop() == 1);

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

    // ret
    ret();
    test(pop() == 3);
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
    ret();
    test(pop() == 10);
    test(pop() == 65);
    test(pop() == 30);

    printf("\n");

    // end of tests
    
    printf("----------------------------------------\n");

    reset_vm(); // vyresetuj VM po testech
    run();

    printf("----------------------------------------\n");

    // uvolni pamet
    free(g->mem);
    free(st->start);

}
