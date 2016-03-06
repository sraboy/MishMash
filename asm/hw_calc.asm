%include "asm_io.inc"

extern printf

segment .data
    fmt db "Op %d %c %d = %d", 10 ,0
    fmtlen equ $ - fmt
    
segment .bss 

    a resd 1
    b resd 1
    op resb 1

segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
input:
		call read_int
        mov [a], eax
        call read_int
        mov [b], eax
        call read_char ;read and discard newline
        call read_char
        mov [op], al
cmps:       
        cmp al, '+'
        jne .m
        call plus
        call print
        jmp input
    .m:
        cmp al, '*'
        jne .e
        call mult
        call print
        jmp input
    .e:   
        cmp al, '^'
        jne .x
        call exp
        call print
        jmp input
    .x:
        cmp al, 'E'
        jmp exit
        
plus:
    ;push ebp
    ;mov  ebp, esp
    
    mov eax, [a]
    add eax, [b]
    
    ;pop ebp
    ret
    
mult:
    ;push ebp
    ;mov  ebp, esp
    
    mov eax, [a]
    imul eax, [b]
    
    ;pop ebp
    ret
    
exp:
    ;push ebp
    ;mov  ebp, esp
    
    mov ecx, [b]
    sub ecx, 1
    mov eax, [a]
    
    .start:
        imul eax, [a]
    loop .start
    
    ;pop ebp
    ret
    
print:
    push dword eax 
    push dword [b] 
    push dword [op]
    push dword [a] 
    push dword fmt
    call printf

    add esp, 20 ;reset stack
    
    ret
exit:
    ;nothing to do here... move along.
    
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
