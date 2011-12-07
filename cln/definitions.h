
#define HEAP_SIZE 1024  // 1 KB
#define STACK_SIZE 1024 // 1 KB
#define BUFFER 128
#define FREELIST_SIZE 2 // 2 sloty 
                        // - tohle vim dopredu, protoze jako jednotku 
                        // pouzivam int, a freelist ma dve pole int
#define ALLOC_HEADER 4  // kolik bytu navic spotrebuje alokace objektu v pameti ?
                        // + 4B udaj o velikosti (jak je to pole dlouhe ?)

// slot - na kazdem systemu muze 
// mit int teoreticky jinou delku
int slot_size;  // velikost slotu v B

#define INTEGER 0x00        // cisla
#define BOOLEAN 0x01        // true / false
#define POINTER 0x10        // ukazatel do pameti - potrava pro GC
#define S_POINTER 0x11      // ukazatel do zasobniku, nebo programu
                            // jde tedy o takovy "system-pointer"

// kazda polozka v pameti
// ma svoje data 4B a je 
// identifikovana VM typem
// VM rozeznava typ ukazatel 
// aby sel delat GC scavenge
// a pak hodnotu integer, coz
// je normalni cislo
typedef struct vm_val {
    char type;          
    int data;
} vm_val;

// VM globals
struct program * pr;        // program
struct stack * st;          // zasobnik
struct gc * g;              // pamet (GC)
char * output_filename;     // jmeno vystupniho souboru
FILE * output_file;         // vystupni soubor
struct vm_val ret_reg;                // registr pro navratove hodnoty funkci

// Aby se dali jednoduse realokovat 
// pole, je potreba mit dvojitou 
// dereferenci - puvodni objekt 
// totiz po realokaci zmeni adresu
// ale promenne v programu zustavaji
// stejne - takze alloctable ...
typedef struct vm_val * alloctable_item;  // ukazatel na opravdovou pozici
alloctable_item * alloctable;   // tabulka                    

// Stack je adresovan po vm_val kusech
typedef struct stack {
    struct vm_val * start;        // Zacatek stacku
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

// Garbage Collector
typedef struct gc {
    char * mem;     // pamet je adresovana po char-ech, protoze se tam
    char * old;     // davaji ty velikosti, takze to nejde adresovat jenom
                    // po vm_val - ta sama o sobe take neni delitelna 4B 
                    // protoze obsahuje type, ktery ma jen 1B
    int real_size;  // velikost v B
    int size;       // velikost ve (slotech)
    int list;       // index listu   
} gc;

// alokuj v GC pameti 
// gc - garbage collector
// size - pozadovana velikost v bytech
int allocate(gc * gcl, int size);
