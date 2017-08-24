#include <stdio.h>

extern char * dothings(char opt);
extern char * dootherthings(char opt);

int main(int argc, char** argv) {
	if(argc == 1) {
		char * msg = dothings(argv[1][0]);
        printf(msg);
    } else if (argc == 2) {
        char * msg = dootherthings(argv[1][0]);
        printf(msg);
    }
}

