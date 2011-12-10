#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <strings.h>
#include <stdio.h>

#include "options.h"

void parse_options(int argc, char ** argv) {

    // pokud jsou zde nejake options
    // tak je pouzij
    if (argc > 3) {
        for (int i=3; i < argc; i++) {
            if (strcmp(argv[i],"-d") == 0) { debugger = 1; continue; }
            if (strcmp(argv[i],"-m") == 0) { 
                // je tam i ta hodnota ?
                if (argc == i + 1) {
                    printf("\nEmpty value for heap size option\n\n");
                    exit (-1);
                }
                if (sscanf (argv[i+1],"%d",&heap_size) == 0) {
                    printf("\nInvalid value for heap size option\n\n");
                    exit (-1);
                }
                i++;
                continue; 
            }
            if (strcmp(argv[i],"-s") == 0) {
                // je tam i ta hodnota ?
                if (argc == i + 1) {
                    printf("\nEmpty value for stack size option\n\n");
                    exit (-1);
                }
                if (sscanf (argv[i+1],"%d",&stack_size) == 0) {
                    printf("\nInvalid value for stack size option\n\n");
                    exit (-1);
                }
                i++;
                continue; 
            }
            printf("\n Unknown option '%s'\n\n",argv[i]);
            exit (0);
        }
    }

}

