#/bin/bash
NAME=firstL
nasm -f elf -d ELF_TYPE asm_io.asm
nasm -f elf $NAME.asm 
gcc -m32 -o $NAME.out $NAME.o driver.c asm_io.o
