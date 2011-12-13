#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <strings.h>
#include <stdio.h>

#include "definitions.h"
#include "interpret.h"

#define TEXT_BUFFER 256
#define MAX_BREAKPOINTS 256
#define MEM_DUMP_GROUPING 5 
#define STACK_DUMP_GROUPING 5

char breakpoint[MAX_BREAKPOINTS];
int breakpoints = 0;

void mem_dump() {

    int i=0; 
    vm_val * slot = g->mem;
    while (i < g->slots) {
        printf(" \e[32mM%d\t@", i);
        printf(" \e[32m0x%p:\e[0m\t", slot);
        for (int j=0; j < MEM_DUMP_GROUPING; j++) {
            printf("%02x:",slot->head.type);
            printf("0x%08x\t",slot->body.it);
            slot++; i++;
            if (i > g->slots) break;
        }
        printf("\n");
    }

}

void print_stack() {

    int i=0; 
    vm_val * slot = st->start;
    while (i < st->slots) {
        printf(" \e[32m0x%p:\e[0m\t", slot);
        for (int j=0; j < STACK_DUMP_GROUPING; j++) {
            if (st->sp == slot) printf("\e[1;33m");
            if (st->fp == slot) printf("\e[44m");
            printf("%02x:",slot->head.type);
            printf("0x%08x",slot->body.it);
            printf("\e[0m\t");
            slot++; i++;
            if (i > st->slots) break;
        }
        printf("\n");
    }
}

void print_freelist() {

    printf("Address: 0x%p, %d B (%d slots), ", 
            g->free, 
            (g->freeslots - 1) * sizeof(vm_val),  
            g->freeslots - 1);
}

// console mark
void cm() {
    printf(" \e[1;31mgiraffe > \e[0m");
}

int read_str(char * text) {
    fgets( text, TEXT_BUFFER, stdin);
    char *newline = strchr(text, '\n'); 
    if ( newline != NULL )
        *newline = '\0'; // overwrite trailing newline
    return strlen(text);
}

char read_number() {

    unsigned int number;
    while (scanf("%02x", &number) == 0); 
    return (char) number;
}

char dbg_step() {

    char opcode;

    if (pr->ip < pr->size) {
        // nacti instrukci
        opcode = next();
        printf(" Byte: 0x%02x ", opcode);
        bytecode_switch(opcode);
        printf("\n");
    }

    return opcode;

}

void dbg_run() {
    
    char opcode;
    
    // dokud to jde tak jed
    while (pr->ip < pr->size) {
        opcode = dbg_step();
        
        for (int i=0; i < breakpoints; i++) {

            // pokud je to breakpoint instrukce
            // vyskoc ven z provadeni
            if (breakpoint[i] == opcode) return;
        }
        
    }

}

// nastavi breakpoint
void set_breakpoint() {
    printf(" Enter instruction opcode: ");
    char instruction = read_number(); 
    // ano, je tady postinkrement 
    breakpoint[breakpoints++] = instruction; 
    printf(" setting breakpoint on instruction 0x%02x\n",instruction);
}

// Neco jako GDB
void debug() {
    
    char command[TEXT_BUFFER];
    char last_command[TEXT_BUFFER];
    
    breakpoints = 0;

    // nacti hlavicku souboru, main apod.
    run_main();

    while (1) {

        cm();   // console mark
        read_str(command);

        // posledni prikaz
        if (strcmp(command,".") == 0) {
            // nahrad prikaz "." prikazem 
            // ktery se provedl posledne
            strcpy(command,last_command);
        }

        // spust to cele znova 
        if (strcmp(command,"run") == 0) {
            reset_vm();
            run_main();
            dbg_run();
        }

        // pokracuj 
        if ((strcmp(command,"continue") == 0) ||
                (strcmp(command,"c") == 0)) {
            dbg_run();
        }

        // nastav breakpoint 
        if ((strcmp(command,"break") == 0) ||
                (strcmp(command,"b") == 0)) {
           set_breakpoint(); 
        }

        // Vypis pameti
        if ((strcmp(command,"memory") == 0) ||
                (strcmp(command,"m") == 0)) {
            mem_dump();
        }
        
        // Vypis freelistu
        if ((strcmp(command,"freespace") == 0) || 
                (strcmp(command,"f") == 0)) {
            print_freelist();
        }

        // Vypis zasobniku
        if ((strcmp(command,"stack") == 0) || 
                (strcmp(command,"t") == 0)) {
            print_stack();
        }

        // udelej krok 
        if ((strcmp(command,"step") == 0) ||
                (strcmp(command,"s") == 0)) {
            dbg_step();
        }

        // pokud jsem dojel na 
        // konec programu ukonci DBG
        if ((strcmp(command,"quit") == 0) || (pr->ip >= pr->size)) {
            printf("----------------------------------------\n");
            printf(" Debugger end\n");
            printf("----------------------------------------\n");
            break;
        }

        // uloz si posledni prikaz
        strcpy(last_command,command);
    }
}


