%include "asm_io.inc"

extern printf

segment .data
    unitprompt db "Please enter the unit:",0
    unitpromptlen equ $ - unitprompt
    bytesprompt db "Please enter the number of bytes:",0
    bytespromptlen equ $ - bytesprompt
    resultoutput db "The result is: %d", 10, 0
    resultoutputlen equ $ - resultoutput    
    
segment .bss 

    bytes resd 1  ;32-byte int
    unit resb 1

segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
    ;***************CODE STARTS HERE***************************
    ;call read_int ;give me a chance to attach gdbtui
    input:       
        mov eax, unitprompt
        call print_string
        call read_char ;read and discard newline
        mov [unit], al ;0x8049ce8
        mov eax, bytesprompt
        call print_string
        call read_int
        mov [bytes], eax ;0x8049ce4

        push dword [unit]     ;char convertTo, push dword for stack alignment
        push dword [bytes]    ;int num, push dword for stack alignment
    
        call calc
        add esp, 8            ;delete stack space for parameters
        jmp exit
        
    calc:   ;int calc(int num, char convertTo)
        push ebp        ;save old base pointer to make room for local vars
        mov ebp, esp    ;set old stack pointer for local use
        push ebx        ;save ebx
    .cmps:
        .k:
        brk4:
            mov eax, [ebp+12]
            mov ebx, 0x4b ;0x4b; 'K'
            cmp eax, ebx
            jne .m
            mov eax, [ebp+8]
            shr eax, 10
            jmp .resultprint
        .m:
            mov eax, [ebp+12]
            mov ebx, 0x4d ;0x4d; 'M'
            cmp eax, ebx
            jne .g
            mov eax, [ebp+8]
            shr eax, 20
            jmp .resultprint
        .g:   
            mov eax, [ebp+12]
            mov ebx, 0x47 ;0x47; 'G'
            cmp eax, ebx
            ;no validation, so no jne
            mov eax, [ebp+8]
            shr eax, 30
        .resultprint:
            push dword eax ;eax=result
            push dword resultoutput
            call printf
            add esp, 8
        .leave:
            pop ebx     ;restore for previous frame
            mov esp, ebp 
            pop ebp
            ret
    exit:
    ;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
