#include <stdio.h>

extern char * ihaveareffunc(char opt);

int main(int argc, char** argv) {
    if(argc == 1) {
        char * msg = ihaveareffunc(argv[1][0]);
        printf("%s", msg);
    } else if (argc == 2) {
        printf("test");
    }
}

