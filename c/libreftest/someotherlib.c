#include <stdio.h>

static const char * __dootherthings(char opt);
const char * iamareffunc(char opt);
__attribute__((cold, noinline)) const char * ihaveareffunc(char opt);
const char * idonthaveareffunc(char opt);// __attribute__((hot));
int __getanum(int x, int y);
__attribute__((noinline)) int __somefunc5(int x, int y);


/*
const char * reallydootherthings(char opt);// __attribute__((hot));
const char * reallydoyetmorethings(char opt);// __attribute__((hot));
const char * reallydootherthings(char opt) {
    return __dootherthings(opt);
}
const char * reallydoyetmorethings(char opt) {
    return __dootherthings(opt);
}
*/
const char * idonthaveareffunc(char opt) {
    return __dootherthings(opt + 1);
}

const char * ihaveareffunc(char opt) {
    return iamareffunc(opt + 1);
}

static const char * __dootherthings(char opt) {
    opt += __getanum(opt, 2);
    opt += __getanum(opt, 3);
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
            opt += __getanum(i, 4);
        } else if (opt == 'b') {
            opt += __getanum(i, 5);
        } else {
            opt += __getanum(i, 6);
        }
    }
    msg[0] = opt;
    return msg;
}

const char * iamareffunc(char opt) {
    char * msg = "teststring";
    for(int i = 0; i < 5; i++){
        if(opt == 'a') {
            opt += __getanum(i, 4);
        } else if (opt == 'b') {
            opt += __getanum(i, 5);
        } else {
            opt += __getanum(i, 6);
        }
    }
    msg[0] = opt;
    return msg;
}


int __getanum(int x, int y) {
    return (x+y)*y;
}
