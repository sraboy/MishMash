#include <stdio.h>
#include <ctype.h>
#include <stdint.h>

extern int doupper(int x, int y);
extern int dolower(int x, int y);

uint64_t qwerqwer(uint64_t x);// __attribute__((cold));
int asdfasdf(int x, int y);// __attribute__((hot));
float calldoupper(int x, char y, float f, int a, int b, char * c, int* d, char e);// __attribute__((hot));
void calldolower() __attribute__((hot));
void morecalldolower();

uint64_t qwerqwer(uint64_t x) {
    int i = x;
    int y = i * x + 4;
    char str[] = "some STRING";
    volatile float result = x + y;
    while(str[i + x]) {
        putchar(toupper(str[y]));
        result += x + 4;
        i++;
    }
    y = asdfasdf((int)result, i);
    putchar('\n');
    return result * x + (4 * i * y);
}

int asdfasdf(int x, int y) {
    int i = x;
    volatile char str[] = "some STRING goes HERE";
    putchar(tolower(str[y]));
    i++;
    putchar('\n');
    return asdfasdf(i, x * 2);
}

float calldoupper(int x, char y, float f, int a, int b, char * c, int* d, char e) {
    doupper(dolower(a + b, calldoupper(x, 'c', x * 0.03f, 0xffffffff, 234, "asdf", &x, 'e')), 3);
    f = (float)(x / (int)y);
    return f;
}

void calldolower() {
    int y = doupper(7, 323);
    float x = calldoupper(doupper(7, 34), doupper(7, 39238), 7.5f, 3, 2, "asdfasdf", &y, 'a');
    doupper(dolower(x + y, calldoupper(x, 'c', x * 0.03f, 0xffffffff, 234, "asdf", &x, 'e')), 3);
    printf("Doing things %d", y);
    printf("Other things %f", x);
}

void morecalldolower() {
    int y = doupper(7, 233);
    float x = y * 0.066;
    doupper(dolower(x + y, calldoupper(x, 'c', x * 0.03f, 0xffffffff, 234, "asdf", &x, 'e')), doupper(dolower(x + y, calldoupper(x, 'c', x * 0.03f, 0xffffffff, 234, "asdf", &x, 'e')), 3));
    
    printf("Doing things %d", y);
    printf("Other things %f", x);
}

float morecalldoupper(int x, char y, float f, int a, int b, char * c, int* d, char e) {
    dolower(dolower(a + b, calldoupper(x, 'c', x * 0.03f, 0xffffffff, 234, "asdf", &x, 'e')), 3);
    f = (float)(x / (int)y);
    return f;
}

float moremorecalldoupper(const int x, char y, float f, int a, int b, char * c, int* d, char e) {
    c[0] += 47;
    c[1] += 47;
    d = 3;
    volatile int wdvc = dolower(dolower(a + b, calldoupper(x, 'c', x * 0.03f, 0xfffabcde, 234, c, &x, 'e')), 3);
    f = (float)(x / (int)y);
    return dolower(wdvc, a);
}
