%include "asm_io.inc"
segment .data 
    a dd 0xA1B2C3D4
segment .bss 

segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	mov ebx, 30h

mov eax, 20h

shl eax, 16

push ebx

push eax

pop ebx
    
        
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
