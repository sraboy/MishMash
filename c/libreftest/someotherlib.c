#include <stdio.h>


__attribute__((noinline))
int __getanum(int x, int y) {
    return (x+y)*y;
}

__attribute__((noinline))
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

__attribute__((noinline, hot))
const char * ihaveareffunc(char opt) {
    return iamareffunc(opt + 1);
}

__attribute__((noinline))
const char * iamareffunc2(char opt) {
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

__attribute__((noinline))
const char * ihaveareffunc2(char opt) {
    return iamareffunc2(opt + 2);
}


__attribute__((noinline))
const char * __dootherthings(char opt) {
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


__attribute__((noinline, cold))
const char * nope1(char opt) {
    return __dootherthings(opt + 1);
}

__attribute__((noinline))
void nope2(char opt) {
    volatile int volatile * x =  nope1(opt);
    x += 0x7FFFFFFFFFFFFEEE;
    x += (int)__dootherthings(x);
    return;
}

__attribute__((noinline))
void nope3(char opt) {
    volatile int volatile * x =  nope1(opt);
    x += 0x7FFFFFFFFFFFFEEE;
    x += (int)nope1(x);
    return;
}

