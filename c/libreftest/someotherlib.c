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
const char * somejunk(char opt) {
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
    return somejunk(opt + 2);
}


__attribute__((noinline))
const char * iamalsoareffunc(char opt) {
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
const char * ialsohaveareffunc(char opt) {
    return iamalsoareffunc(opt + 1);
}

__attribute__((noinline))
void nope2(char opt) {
    volatile int volatile * x =  ialsohaveareffunc(opt);
    x += 0x7FFFFFFFFFFFFEEE;
    x += (int)iamalsoareffunc(x);
    return;
}

__attribute__((noinline))
void nope3(char opt) {
    volatile int volatile * x =  ialsohaveareffunc(opt);
    x += 0x7FFFFFFFFFFFFEEE;
    x += (int)ialsohaveareffunc(x);
    return;
}

