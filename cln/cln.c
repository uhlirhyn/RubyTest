#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <strings.h>
#include <assert.h>
#include <stdio.h>

#define MEMORY_SIZE 1024 // KB
#define BUFFER 256

// Sum: 12 B
typedef struct obj {
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

typedef struct gc {
    obj * mem;
    int obj_size;
    int slots_count;
    int real_size;
    struct freelist * list;   
} gc;

void init(gc * gcl)  {

    // alokace meho pametoveho prostoru
    // potrebuju celociselny pocet obj do celkove velikosti MEMORY_SIZE
    gcl->obj_size = sizeof(obj);
    gcl->slots_count = (MEMORY_SIZE / gcl->obj_size);
    gcl->real_size = gcl->slots_count * gcl->obj_size;
    gcl->mem = (obj *) malloc(gcl->real_size);

    // vynuluj pamet
    bzero((void*) gcl->mem, gcl->real_size);

    // zalozeni freelistu;
    gcl->list = (freelist *) gcl->mem;
    gcl->list->size = gcl->slots_count;
    gcl->list->next = NULL;

}

void mem_dump(gc * gcl, int grouping) {

    char * mem = (char*) gcl->mem;

    printf("--------------------------------------\n");
    printf("  MEMORY DUMP \n");
    printf("--------------------------------------\n");

    *(mem + gcl->real_size) = 0xFF;

    int i=0; 
    while (i < gcl->real_size/sizeof(char)) {
        printf("%p:", mem+i);
        for (int j=0; j < grouping; j++) {
            printf("\t%X ",*(mem + i++));
            if (i > gcl->real_size/sizeof(char)) break;
        }
        printf("\n");
    }

}

void print_freelist(gc * gcl) {

    printf("--------------------------------------\n");
    printf("  FREE LIST \n");
    printf("--------------------------------------\n");

    freelist * next = gcl->list;

    while(next != NULL) {

        printf("Address: %p, %d slots (%d B), next freespace on %p\n",
                next, next->size, next->size*gcl->obj_size, next->next);

        next = next->next;
    }
}

obj * allocate(gc * gcl, int size) {  

    freelist * next = gcl->list;

    // najdi takovou velikost volneho prostoru kam by se tohle veslo
    while(next != NULL) {

        // pokud jsem nasel dost velke misto, 
        // uprav freelist a vrat na nej referenci
        if (next->size >= size) {

            if (next->size == size) { 

                // neni tam misto, vyslo to presne
                // pouzij dalsi volny flek
                gcl->list = next->next;

            } else {

                // je tam jeste kus mista,
                // odecti ho a zaloz novou
                // polozku freelistu 
                gcl->list = (freelist *) ((obj *) next + size);
                gcl->list->size = next->size - size;
                gcl->list->next = next->next;
            }

            return (obj *) next;

        } else {    
            // jinak pokracuj dal
            next = next->next;
        }
    }

    // doslo misto nenasel jsem dost velky kus- next == NULL
    // scavenge()

}

// console mark
void cm() {
    printf("giraffe > ");
}

int read_instruction(char * text) {

    cm();

    if ( fgets(text, sizeof text, stdin) != NULL ) {

        // search for newline character
        char *newline = strchr(text, '\n'); 
        if ( newline != NULL )
            *newline = '\0'; // overwrite trailing newline
    }

    return strlen(text);

}

int read_number(int * number) {

    char text[10];

    cm();

    if ( fgets(text, sizeof text, stdin) != NULL ) {
        if ( sscanf(text, "%d", number) == 1 )
            return 0;
    }

    return 1;
}

int main ( int argc, char **argv ) {

    // zaloz GC a alokuj pamet
    gc gcl;
    init(&gcl);

    printf("----------------------------------------\n");
    printf(" Giraffe !\n----------------------------------------\n");

    printf(" Obj size:\t%d\n",gcl.obj_size);
    printf(" Mem location:\t%p - %p\n",gcl.mem,gcl.mem + gcl.slots_count);
    printf(" Obj slots:\t%d\n",gcl.slots_count);
    printf(" Real size:\t%d B\n",gcl.real_size);

    printf("----------------------------------------\n");
    
    char instruction[BUFFER];
    int arg;

    // REPL
    while (1) {

        // cti instrukci
        while (read_instruction(instruction) == 0);

        // alokace
        if (strcmp(instruction,"al") == 0) {
            printf("How much allocate ?\n");
            while (read_number(&arg));
            obj * alloc_1 = allocate(&gcl,arg);
            printf("Allocated %d obj-s (%d bytes) from address %p\n", 
                    arg, arg * gcl.obj_size, alloc_1);
        }

        // print memory
        if (strcmp(instruction,"pm") == 0) {
            mem_dump(&gcl,20);
        }

        // print freelist
        if (strcmp(instruction,"pf") == 0) {
            print_freelist(&gcl);
        }

        // quit
        if (strcmp(instruction,"q") == 0) {
            printf("Quit ...\n");
            break;
        }

        // help
        if (strcmp(instruction,"h") == 0) {
            printf("pm - print memory\n");
            printf("pf - print freelist\n");
            printf("al - alocate\n");
            printf("q - quit\n");
            printf("h - help\n");
        }

    }

    // uvolni pamet
    free(gcl.mem);

}
