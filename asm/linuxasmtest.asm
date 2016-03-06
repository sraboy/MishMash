; 32-bit "hello world"
; nasm -f elf32 *.asm
; ld -melf_i386 *.o

global _start

section .text

_start:

    ;sys_write(stdout, message, length)
    
    mov     eax, 4          ;sys_write
    mov     ebx, 1          ;stdout
    mov     ecx, message    ;message address
    mov     edx, length     ;message string length
    int     0x80
    
    ;sys_read
    mov     eax, 3
    mov     ebx, 0
    mov     ecx, message
    mov     edx, 100
    int     0x80

    sub     ebp, 4
    mov     eax, 4          ;sys_write
    mov     ebx, 1          ;stdout
    mov     ecx, [ebp]      ;message address
    mov     edx, length     ;message string length
    int     0x80
    
    ;sys_exit(return_code)
    mov     eax, 1         ;sys_exit
    mov     ebx, 0         ;return 0 (success)
    int     0x80
    
section .data
    message: db 'Hello World!', 0x0A ;message and newline
    length: equ $-message
