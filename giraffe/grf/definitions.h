
#define DEFAULT_HEAP_SIZE 1024  // 1KB heap
#define DEFAULT_STACK_SIZE 1024 // 1KB zasobnik
#define DEFAULT_FD_COUNT 1024   // 1KB file descriptors

#define BUFFER 128

typedef enum {
    
    // cisla
    BOOLEAN = 0x01,     // true / false
    INTEGER = 0x02,     // cisla

    // znak retezce
    CHARACTER = 0x40,   // znak

    // ukazatele
    POINTER = 0x10,     // ukazatel do pameti - potrava pro GC
    NIL = 0x1F,         // nil

    // systemove udaje
    S_POINTER = 0x11,   // ukazatel do zasobniku
    I_POINTER = 0x12,   // instruction pointer - ukazatel do programu
    SLOT_ID = 0x13,     // index slotu promenne
    FILE_DESC = 0x14,   // file descrptor
    ARRAY_SIZE = 0x20,  // velikost pole
    SCAVENGED = 0x30,   // mark pro presunute objekty

} vm_val_type;          

// kazda polozka v pameti
// ma svoje data 4B a je 
// identifikovana VM typem
// VM rozeznava typ ukazatel 
// aby sel delat GC scavenge
// a pak hodnotu integer, coz
// je normalni cislo

// slot fixed size
typedef struct vm_val {
    union {
        vm_val_type type;       // typ hodnoty
    } head;
    union {
        struct vm_val * pt;     // pro SP, FP
        struct vm_val * rf;     // pro heap
        FILE * fd;              // file descriptor
        unsigned int sl;        // slot na stacku (local, arg
        unsigned int ip;        // instruction pointer
        int it;                 // int
        char ch;                // char
        char bl;                // bool
        unsigned int sz;        // array size
    } body;
} vm_val;

// VM globals
struct program * pr;        // program
struct stack * st;          // zasobnik
struct gc * g;              // pamet (GC)
struct vm_val ret_reg;      // registr pro navratove hodnoty funkci
FILE ** fds;                // pole systemovych file deskriptoru
int free_fds;               // kolik je volnych FD
int fdsa_size;              // velikost pole FD

// Aby se dali jednoduse realokovat 
// pole, je potreba mit dvojitou 
// dereferenci - puvodni objekt 
// totiz po realokaci zmeni adresu
// ale promenne v programu zustavaji
// stejne - takze alloctable ...
typedef struct vm_val * alloc_table_item;    // ukazatel na opravdovou pozici
alloc_table_item * alloc_table;              // tabulka                    

// Stack je adresovan po vm_val kusech
typedef struct stack {
    struct vm_val * start;  // Zacatek stacku
    struct vm_val * sp;     // Stack pointer - ukazuje na prazdne pole
    struct vm_val * fp;     // (index) Frame pointer - zacatek ramce, ukazuje na prvni pole ramce
    unsigned int size;      // velikost v B
    unsigned int slots;     // velikost ve slotech (vm_val-s)
} stack;

typedef struct program {
    char * filename;        // jmeno souboru
    char * bytes;           // instrukce (nacteny soubor)
    unsigned int size;      // velikost souboru
    unsigned int ip;        // aktualni instrukce (index BC) ktera se ma provest
} program;

// Garbage Collector
typedef struct gc {
    vm_val * mem;           // pamet je adresovana po vm_val-s
    vm_val * old;           // scavenge swap
    vm_val * free;          // freelist
    unsigned int freeslots; // kolik slotu je volnych
    unsigned int size;      // velikost v B
    unsigned int slots;     // velikost ve slotech (vm_val-s)
} gc;

// alokuj v GC pameti 
// gc - garbage collector
// size - pozadovana velikost ve slotech 
vm_val * allocate(unsigned int slots);
