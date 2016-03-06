#/bin/bash
NAME=firstO
nasm -f macho asm_io.asm
nasm -f macho $NAME.asm 
ld -o $NAME.out $NAME.o asm_io.o -arch i386 -lc -macosx_version_min 10.6
