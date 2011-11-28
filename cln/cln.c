#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <strings.h>
#include <assert.h>
#include <stdio.h>

#define HEAP_SIZE 1024  // 1 KB
#define STACK_SIZE 1024 // 1 KB
#define BUFFER 128

struct var * stack_end;

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

// funkce
typedef struct fce {
    

}

void scavenge(gc * gcl) {

    //....

}

obj * lookup_var(env * e, char * id) {

    env * prev = e;

    // projdi po ptrech env
    while (prev != NULL) {
        // projdi sekvencne promenne
        for (int i=0; i < prev->size; i++) {            
            if (strcmp((prev->vars + i)->id, id) == 0) 
                return (prev->vars + i)->value;
        }
        prev = prev->prev;
    }

}

env * new_env(env * en) {

    // zatim se to bude alokovat rucne ...   
    env * new_env = (env *) malloc(sizeof(env));

    new_env->prev = en;
    new_env->size = 0;
    new_env->vars = en->vars + en->size;

    return new_env;
}

env * leave_env(env * en) {

    env * prev = en->prev;

    free(en);

    return prev;

}

void init(gc * gcl, env * ge) {

    //==========
    //    GC
    //==========

    // alokace meho pametoveho prostoru
    gcl->real_size = HEAP_SIZE / 2;
    gcl->mem = (obj *) malloc(gcl->real_size);
    
    // oldspace
    gcl->old = (obj *) malloc(gcl->real_size);

    // vynuluj pamet
    bzero((void*) gcl->mem, gcl->real_size);
    bzero((void*) gcl->old, gcl->real_size);

    // zalozeni freelistu;
    gcl->list = (freelist *) gcl->mem;
    gcl->list->size = gcl->real_size;
    gcl->list->next = NULL;

    //==========
    //  STACK
    //==========

    ge->vars = (var *) malloc(STACK_SIZE);
    ge->size = 0;
    ge->prev = NULL;
    stack_end = (var *) ((void *) ge->vars + STACK_SIZE);
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

void print_envs(env * en) {

    printf("----------------------------------------\n");
    printf("  ENV LIST \n");
    printf("----------------------------------------\n");

    printf("Env size: %d\n", en->size);

    for (int i=0; i < en->size; i++) {
        printf("%s = %p",(en->vars + i)->id,(en->vars + i)->value);
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

int insert_var(env * e, char * id, obj * value, gc * gcl) {

    // na jakou pozici to budu davat
    var * position = e->vars + e->size;

    // je tam misto ?
    if (position < stack_end) {
        position->id = new_str(gcl, id);
        position->value = value;
        e->size++;
    } else {
        // TODO - stack error (out of stack)
        return 0;
    }

    return 1;  
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

int main ( int argc, char **argv ) {

    // zaloz GC a alokuj pamet
    // zaloz stack a na nem global env
    gc gcl;
    env ge;
    init(&gcl, &ge);

    printf("----------------------------------------\n");
    printf(" Giraffe !\n----------------------------------------\n");

    printf(" Mem location:\t%p - %p\n",gcl.mem, gcl.mem + gcl.real_size);
    printf(" Real size:\t%d B\n",gcl.real_size);
    printf(" Stack size:\t%d B\n",STACK_SIZE);

    printf("----------------------------------------\n");
    
    char str[BUFFER];
    int int_arg;
    
    // aktualni env je ten global
    env * current_env = &ge;

    // REPL
    while (1) {

        // cti instrukci
        do {
            cm();
        } while (read_str(str) == 0);

        // alokace
        if (strcmp(str,"al") == 0) {
            do {
                printf("How much allocate? : ");
            } while (read_number(&int_arg) == 0);
            obj * alloc_1 = allocate(&gcl, int_arg * sizeof(obj));
            printf("Allocated %d obj-s (%d bytes) from address %p to %p\n", 
                    int_arg, int_arg * sizeof(obj), alloc_1, 
                    (void *) alloc_1 + int_arg * sizeof(obj));
            do {
                printf("Store in variable: ");
            } while (read_str(str) == 0);
            if (insert_var(current_env, str, alloc_1, &gcl)) {
                printf("Reference on address %p stored in var %s\n", 
                        alloc_1, str);
            } else {
                printf("Store failed ...\n");
            }
            continue;
        }

        // print memory
        if (strcmp(str,"pm") == 0) {
            mem_dump(&gcl,20);
            continue;
        }

        // print freelist
        if (strcmp(str,"pf") == 0) {
            print_freelist(&gcl);
            continue;
        }

        // quit
        if (strcmp(str,"q") == 0) {
            printf("Quit ...\n");
            break;
        }

        // print env
        if (strcmp(str,"pe") == 0) {
            print_envs(current_env);
            continue;
        }

        // new env
        if (strcmp(str,"ne") == 0) {
            current_env = new_env(current_env);
            continue;
        }

        // leave env
        if (strcmp(str,"le") == 0) {
            current_env = leave_env(current_env);
            continue;
        }

        // store 
        if (strcmp(str,"sn") == 0) {
            do {
                printf("Save into variable: ");
            } while (read_str(str) == 0);
            obj * o = lookup_var(current_env, str);
            if (o != NULL) {
                do {
                    printf("Enter value: ");
                } while (read_number(&int_arg) == 0);
                store_number(o, int_arg);
            } else {
                printf("Variable '%s' is not declared\n", str);
            }
            continue;
        }

        // load
        if (strcmp(str,"l") == 0) {
            do {
                printf("Load from variable: ");
            } while (read_str(str) == 0);
            obj * o = lookup_var(current_env, str);
            if (o != NULL) {
                printf("Variable '%s' = '%p'\n", str, o);
            } else {
                printf("Variable '%s' is not declared\n", str);
            }
            continue;
        }

        // help
        if (strcmp(str,"h") == 0) {
            printf("pm - print memory\n");
            printf("pf - print freelist\n");
            printf("al - alocate\n");
            printf("q - quit\n");
            printf("h - help\n");
            printf("le - leave env\n");
            printf("ne - new env\n");
            printf("sn - store number\n");
            printf("l - load\n");
            continue;
        }

        printf("Unknown instruction '%s'\n",str);
    }

    // uvolni pamet
    free(gcl.mem);

}
