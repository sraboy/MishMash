#include <stdio.h>

static int __getanum(int x, int y);
const char * __dootherthings(char opt);
const char * iamareffunc(char opt);
const char * reallydootherthings(char opt);// __attribute__((hot));
const char * reallydoyetmorethings(char opt);// __attribute__((hot));
__attribute__((cold, noinline)) const char * ihaveareffunc(char opt);
const char * addreallydootherthings(char opt);// __attribute__((hot));
int __somefunc2(int x, int y);
int __somefunc5(int x, int y);




const char * reallydootherthings(char opt) {
    return __dootherthings(opt);
}
const char * reallydoyetmorethings(char opt) {
    return __dootherthings(opt);
}
const char * addreallydootherthings(char opt) {
    return __dootherthings(opt + 1);
}
const char * ihaveareffunc(char opt) {
    return iamareffunc(opt + 1);
}

const char * __dootherthings(char opt) {
    opt += __somefunc2(opt, 2);
    opt += __somefunc2(opt, 3);
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
            opt += __somefunc2(i, 4);
        } else if (opt == 'b') {
            opt += __somefunc2(i, 5);
        } else {
            opt += __somefunc2(i, 6);
        }
    }
    msg[0] = opt;
    return msg;
}

const char * iamareffunc(char opt) {
    opt += __somefunc2(opt, 2);
    opt += __somefunc2(opt, 3);
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
            opt += __somefunc2(i, 4);
        } else if (opt == 'b') {
            opt += __somefunc2(i, 5);
        } else {
            opt += __somefunc2(i, 6);
        }
    }
    msg[0] = opt;
    return msg;
}

int __somefunc2(int x, int y) {
    for(;y < x; y++){
        x += y;
    }
    return __somefunc5(x, y);
}

int __somefunc5(int x, int y) {
    for(;y < x; y++){
        x += y;
    }
    return __somefunc2(x, y);
}

static int __getanum(int x, int y) {
    return (x+y)*y;
}
