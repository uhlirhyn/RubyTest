
#define HEAP_SIZE 1024  // 1 KB
#define STACK_SIZE 1024 // 1 KB
#define BUFFER 128

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
