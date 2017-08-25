#include <stdio.h>

const char * dothings(char opt); 
int somefunc1(int x, int y);
int somefunc2(int x, int y);
static int getanum(int x, int y);

const char * dothings(char opt) {
    opt += somefunc1(opt, 2);
    //opt += somefunc1(opt, 3);
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
            opt += somefunc1(i, 5);
        } else {
            opt += somefunc1(i, 6);
        }
    }
    msg[0] = opt;
    return msg;
}

const char * dootherthings(char opt) {
    opt += somefunc2(opt, 2);
    //opt += somefunc2(opt, 3);
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
            opt += somefunc2(i, 4);
        } else if (opt == 'b') {
            opt += somefunc2(i, 5);
        } else {
            opt += somefunc2(i, 6);
        }
    }
    msg[0] = opt;
    return msg;
}

int somefunc2(int x, int y) {
    for(;y < x; y++){
        x += y;
    }
    return somefunc1(x, y);
}

int somefunc1(int x, int y) {
    for(;x < y; x++){
        y += x;
    }
    return somefunc2(x, y);
}

/*int somefunc3(int x, int y, int z) {
    for(;y < x; y++){
        x += y;
    }
    return somefunc5(x, y, 5);
}

int somefunc4(int x, int y, int z) {
    for(;x < y; x++){
        y += x;
    }
    return somefunc6(x, y, 5);
}*/

static int getanum(int x, int y) {
    return (x+y)*y;
}
