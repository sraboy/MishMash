%include "asm_io.inc"
segment .data 

    MinMsg db "The minimum is ", 0
    MaxMsg db "The maximum is ", 0
    PrdMsg db "The product is ", 0
    GcdMsg db "The GCD is ", 0

segment .bss 
    
    Max resd 1 ;32-bit/4-byte int
    Mid resd 1
    Min resd 1
    a   resd 1
    b   resd 1
    
segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
        call read_int
        mov [a], eax
        push eax

        call read_int
        mov [b], eax
        push eax
        
        call read_int
        push eax

        call findminmax ;pass three vars, stores results in global vars
        ;returns 0 if unsuccesful
        
        push dword[a]
        push dword[b]
        xor ecx, ecx    ;must be empty
        call getgcd
cleanup:
        add esp, 20
        
finishgcd:
        push eax        ;put gcd on stack
        
        call getprod    ;muls global vars returns product to eax
        push eax        ;put prod on stack

        mov eax, MinMsg
        call print_string
        mov eax, [Min]
        call print_int
        call print_nl
        
        mov eax, MaxMsg
        call print_string
        mov eax, [Max]
        call print_int
        call print_nl
        
        mov eax, PrdMsg
        call print_string
        pop eax
        call print_int
        call print_nl
        
        mov eax, GcdMsg
        call print_string
        pop eax
        call print_int
        call print_nl
        
jmpexit:
        jmp exit
        
;************ FIND MIN/MAX ************ 
findminmax:
        push ebp
        mov  ebp, esp
        ;sub esp, 12 ;allocate 12 bytes for 3 ints
        
        mov eax, [ebp+8]
        ;pop eax
        mov ebx, [ebp+12]
        ;pop ebx
        mov ecx, [ebp+16]
        ;pop ecx
.checkeax:        
        cmp eax, ebx    
        jl .eaxltebx     ;since eax<ebx jump
        cmp ebx, ecx    ;since eax>ebx cmp ebx/ecx
        ;cmovg edx, ecx  ;if ebx>ecx, save ecx to edx as MIN, eax>ebx>ecx DONE!
        ;test edx, edx   
                        ;if edx is empty,     ZF=1 so eax>ebx<ecx
                        ;if edx is not empty, ZF=0 so eax>ebx>ecx DONE!
        jg .eaxebxecx    ;DONE!
        cmp eax, ecx    ;since eax>ebx<ecx
        jg .eaxecxebx    ;then eax>ecx>ebx
        jl .ecxeaxebx    ;then ecx>eax>ebx
        mov eax, 0      ;fail, equal integers
        mov esp, ebp
        pop ebp
        ret
        
.eaxltebx:            ;eax<ebx ? ecx
        cmp ebx, ecx 
        jl .ecxebxeax ;then eax<ebx<ecx
                     ;then eax<ebx>ecx
        cmp eax, ecx ;since eax<ebx>ecx
        jg .ebxeaxecx ;then ecx<eax<ebx
        jl .ebxecxeax
        mov eax, 0      ;fail, equal integers
        mov esp, ebp
        pop ebp
        ret

.eaxebxecx:
        mov [Max], eax
        mov [Mid], ebx
        mov [Min], ecx
        mov esp, ebp
        pop ebp
        ret
        
.eaxecxebx:
        mov [Max], eax
        mov [Mid], ecx
        mov [Min], ebx
        mov esp, ebp
        pop ebp
        ret
        
.ebxeaxecx:
        mov [Max], ebx
        mov [Mid], eax
        mov [Min], ecx
        mov esp, ebp
        pop ebp
        ret
        
.ebxecxeax:
        mov [Max], ebx
        mov [Mid], ecx
        mov [Min], eax
        mov esp, ebp
        pop ebp
        ret
        
.ecxeaxebx:
        mov [Max], ecx
        mov [Mid], eax
        mov [Min], ebx
        mov esp, ebp
        pop ebp
        ret
        
.ecxebxeax:
        mov [Max], ecx
        mov [Mid], ebx
        mov [Min], eax
        mov esp, ebp
        pop ebp
        ret

;************ END OF FINDMINMAX ************ 

getprod:
        mov eax, [Min]
        mov ebx, [Mid]
        mov ecx, [Max]
        mul ebx
        mul ecx
        ret

getgcd:
        push ebp
        mov ebp, esp
        
        mov eax, dword[ebp+08]  ;max
        mov ebx, dword[ebp+12]  ;min
.loopgcd:        
        cdq
        idiv ebx        ;a/b
        cmp edx, 0      ;a%0 == 0
        je .foundgcd
        mov eax, ebx    ;min to eax
        mov ebx, edx
        jmp .loopgcd
        
.foundgcd:
        mov eax, ebx    ;answer found!
        mov esp, ebp
        pop ebp
        ret
    
	;***************CODE ENDS HERE*****************************
exit:
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
