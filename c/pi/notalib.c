#include <stdio.h>

extern void dothings(char opt);
extern int  dothumb(char opt) __attribute__ ((__target__ ("thumb")));
extern void somefunc();

int main(int argc, char** argv) {
	if(argc > 1)
		dothings(argv[1][0]);
}

void dothings(char opt) {
	switch(opt) {
		case 'a':
			printf("You said %c\n", opt);
			break;
		case 'b':
			printf("You said %c\n", opt);
			break;
		case '\0':
			puts("Really?\n");
			break;
		default:
			puts("Unknown command\n");
			int i = dothumb(opt);
			printf("Got %c from dothumb(opt)\n", opt);
	}

	for(int i = 0; i < 5; i++){
		if(opt == 'a') {
			opt += 4;
			printf("Doing math: %c\n", opt);
		} else if (opt == 'b') {
			printf("Doing other math: %c\n", opt);
		} else {
			printf("What's happening?\n");
		}
	}	
}

int dothumb(char opt) {
	int x = 5 + opt;
	switch(opt) {
		case 46:
			opt += 6;
			printf("46!\n");
			break;
		case 47:
			opt += 4;
			printf("47!\n");
			break;
		default:
			opt -= 7;
			printf("Other: %c\n", opt);
	}
	return opt;
}
