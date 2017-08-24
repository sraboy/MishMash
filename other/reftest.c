extern char calldolower(int x);
extern char calldoupper(int x, char y, float f);

// Compile libreftest with gcc -c -o libreftest.o libreftest.c
// Build a library with ar rcs libreftest.a libreftest.o
// Compile reftest with gcc -o reftest reftest.c libreftest.a
// Make PAT with pelf libreftest.a
// Make SIG with sigmake libreftest.pat libreftest.sig
/*
    gcc -c -o libreftest.o libreftest.c && ar rcs libreftest.a libreftest.o &&\
    gcc -o reftest reftest.c libreftest.a && gcc -S libreftest.c -o libreftest.s &&\
    ./linux/pelf libreftest.a && ./linux/sigmake libreftest.pat libreftest.sig
*/
int main(int argc, char **argv) {
    char x = calldoupper(argc, *argv[2], 0.5f);
    calldolower(argc + *argv[1]);
    return 0;
}
