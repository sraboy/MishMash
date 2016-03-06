sys_exit    equ 1
sys_read    equ 3
sys_write   equ 4
stdin       equ 0
stdout      equ 1
stderr      equ 3

section .data
    welcome db "Welcome to Adder!",10 
    welcomeLen equ $-welcome
    
    promptone db "Enter first number: "
    promptoneLen db $-promptone
    prompttwo db "Enter second number: "
    prompttwoLen db $-prompttwo
    promptop db "Enter operator: "
    promptopLen db $-promptop
        
section .bss
    strBuffer     resb 20
    strBufferLen  equ  $-strBuffer

section .text
    global _start
    
_start:
    mov eax, sys_write     ;4=sys_write
    mov ebx, stdout        ;1=stdout's file descriptor
    mov ecx, welcome       ;puts the offset into ecx
    mov edx, welcomeLen    ;puts the value of helloLen in edx
                           ;brackets aren't needed because it's a constant
    int 0x80
    
    mov eax, sys_write
    mov ebx, stdout
    mov edx, 3
    int 0x80
    
    mov eax, sys_read    ;3=sys_read
    mov ebx, stdin       ;0=stdin
    mov edi, strBuffer
    mov edx, 5
    int 0x80

    add ecx, edi

    mov eax, sys_write
    mov ebx, stdout
    mov ecx, promptone
    mov edx, promptoneLen
    int 0x80
    
    mov eax, sys_exit   ;1=sys_exit
    mov ebx, 0          ;0=exit with 0, meaning no error
    int 0x80 
