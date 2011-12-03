
//=============================
//  VM je zatim pouze pro 32b
//=============================

#define HEAP_SIZE 1024  // 1 KB
#define STACK_SIZE 1024 // 1 KB
#define BUFFER 128
#define FREELIST_SIZE 2 // 2 sloty 
                        // - tohle vim dopredu, protoze jako jednotku 
                        // pouzivam int, a freelist ma dve pole int
#define ALLOC_HEADER 1  // kolik slotu navic spotrebuje alokace objektu v pameti ?
                        // + 1 udaj o velikosti (jak je to pole dlouhe ?)

// slot - na kazdem systemu muze 
// mit int teoreticky jinou delku
int slot_size;  // velikost slotu v B

// VM globals
struct program * pr;        // program
struct stack * st;          // zasobnik
struct gc * g;              // pamet (GC)
char * output_filename;     // jmeno vystupniho souboru
FILE * output_file;         // vystupni soubor
int ret_reg;                // registr pro navratove hodnoty funkci

// Aby se dali jednoduse realokovat 
// pole, je potreba mit dvojitou 
// dereferenci - puvodni objekt 
// totiz po realokaci zmeni adresu
// ale promenne v programu zustavaji
// stejne - takze alloctable ...
typedef int * alloctable_item;  // ukazatel na opravdovou pozici
alloctable_item * alloctable;   // tabulka                    

typedef struct stack {
    int * start;        // Zacatek stacku
    int sp;     // (index) Stack pointer - ukazuje na prazdne pole
    int fp;     // (index) Frame pointer - zacatek ramce, ukazuje na prvni pole ramce
    int real_size;  // velikost v B
    int size;       // velikost ve (slotech)
} stack;

typedef struct program {
    char * filename;        // jmeno souboru
    char * bytes;           // instrukce (nacteny soubor)
    int size;               // velikost souboru
    int ip;                 // aktualni instrukce (index BC) ktera se ma provest
} program;

// Abych nemusel alokovat celou tabulku pro 
// polozky listu, mohl bych volne sloty pameti
// pouzit rovnou jako ty polozky - gc by tak
// mel pouze prvni polozku a zbytek by byl ulozen
// v te pameti ... 

// Sum: 8 B
typedef struct freelist {
    int size;   // kolik toho mista je 
    int next;   // dalsi polozka listu (index)
} freelist;

// obj - na prvnim miste je 
// jeho velikost, pak jsou 
// ty data
typedef int obj;

// Garbage Collector
typedef struct gc {
    obj * mem;
    obj * old;
    int real_size;  // velikost v B
    int size;       // velikost ve (slotech)
    int list;       // index listu   
} gc;

// alokuj v GC pameti 
// gc - garbage collector
// size - pozadovana velikost v bytech
int allocate(gc * gcl, int size);
