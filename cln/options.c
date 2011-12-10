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
            printf("\n Unknown option '%s'\n\n",argv[i]);
            exit (0);
        }
    }

}

