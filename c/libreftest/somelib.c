#include <stdio.h>

const char * dothings(char opt); 
const char * dootherthings(char * opt); 
int somefunc1(int x, int y); __attribute__((hot))
extern int somefunc2(int x, int y);
static int getanum(int x, int y);

const char * dothings(char opt) {
    char * msg;
    switch(opt) {
        case 'a':
            msg = "Got a";
            break;
        case 'b':
            msg = "Got b";
            break;
        case '\0':
            msg = "For serious?";
            break;
        default:
            msg = "Unknown command";
    }

    for(int i = 0; i < 5; i++){
        if(opt == 'a') {
            opt += somefunc1(i, 4);
        } else if (opt == 'b') {
            opt += somefunc1(i, 6);
        } else {
            opt += somefunc1(i, 4);
        }
    }
    msg[0] = opt;
    return msg;
}

const char * dootherthings(char * opt) {
    char * msg;
    char copt = opt[0];

    for(int i = 0; i < 5; i++){
        if(copt == 'a') {
            copt += somefunc2(i, 4);
        } else if (copt == 'b') {
            copt += somefunc2(i, 6);
        } else {
            copt += somefunc2(i, 4);
        }
    }
    msg[0] = copt;
    return msg;
}

int somefunc1(int x, int y) {
    for(;x < y; x++){
        y += x;
    }
    return getanum(x, y);
}

static int getanum(int x, int y) {
    return (x+y)*y;
}

