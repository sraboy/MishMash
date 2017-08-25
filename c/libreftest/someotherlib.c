#include <stdio.h>

const char * __dootherthings(char opt);
const char * __doyetmorethings(char opt);
int __somefunc2(int x, int y);
static int __getanum(int x, int y);

const char * reallydootherthings(char opt) __attribute__((hot));
const char * reallydoyetmorethings(char opt) __attribute__((hot));

const char * reallydootherthings(char opt) {
    return __dootherthings(opt);
}
const char * reallydoyetmorethings(char opt) {
    return __doyetmorethings(opt);
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

const char * __doyetmorethings(char opt) {
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
    return __somefunc1(x, y);
}

int __somefunc5(int x, int y) {
    for(;y < x; y++){
        x += y;
    }
    return __somefunc3(x, y);
}

static int __getanum(int x, int y) {
    return (x+y)*y;
}
