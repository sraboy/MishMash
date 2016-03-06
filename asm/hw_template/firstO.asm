%include "asm_io.inc"
SEGMENT .data

SEGMENT .text
global start
extern _printf

start:
	; Align stack on a 16 bytes boundary,
	; as we'll use C library functions
	push ebp
	mov     ebp,                esp
	and     esp,                0xFFFFFFF0
	sub esp, 16
	;***************CODE STARTS HERE***************************	
	
	
	;***************CODE ENDS HERE*****************************
	pop ebp
	mov esp, ebp
	mov eax, 0x1 
	sub esp, 4   
	int 0x80 
