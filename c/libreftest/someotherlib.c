int somefunc2(int x, int y); __attribute__((cold))

int somefunc2(int x, int y) {
    for(;y < x; y++){
        x += y;
    }
    return x*y;
}
