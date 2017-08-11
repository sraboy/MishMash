#include <stdio.h>

extern void dothings(char opt);

void dothings(char opt) {
	switch(opt) {
		case 'a':
			printf("You said %c", opt);
			break;
		case 'b':
			printf("You said %c", opt);
			break;
		case '\0':
			puts("Really?");
			break;
		default:
			puts("Unknown command");
	}

	for(int i = 0; i < 5; i++){
		if(opt == 'a') {
			opt += 4;
			printf("Doing math: %c", opt);
		} else if (opt == 'b') {
			printf("Doing other math: %c", opt);
		} else {
			printf("What's happening?");
		}
	}	
}

