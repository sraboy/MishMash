;***********************************************************************
; This "multi_code" project was just me testing out some very simple
; operations in various languages. The goal was to have each code 
; snippet take the same exact input and produce the same exact output.
; The "input.txt" file is just two integers that are piped into each
; binary, which multiplies them and prints the result.
; 
; 
; This program is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.

; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.

; You should have received a copy of the GNU General Public License
; along with this program.  If not, see <http://www.gnu.org/licenses/>. 
;***********************************************************************

sys_exit equ 1
sys_read equ 3
sys_write equ 4
stdin equ 0
stdout equ 1

section .data

    promptOne db 'Enter first number: ', 0xA
    promptOneLen equ $-promptOne
    
    promptTwo db 'Enter second number: ', 0xA
    promptTwoLen equ $-promptTwo
    
    resultstr db 'Result: ', 0xA
    resultstrLen equ $-resultstr

section .bss
    num resb 4

section .text
    global _start
    
_start:
    mov eax, sys_write ;4
    mov ebx, stdout    ;1
    mov ecx, promptOne
    mov edx, promptOneLen
    int 0x80
    mov eax, 4
    call get
    push eax    ;multiplicand 
        
    mov eax, sys_write ;4
    mov ebx, stdout    ;1
    mov ecx, promptTwo
    mov edx, promptTwoLen
    int 0x80
    call get
    push eax    ;multiplier
    
multprint:
    mov eax, sys_write ;4
    mov ebx, stdout    ;1
    mov ecx, resultstr
    mov edx, resultstrLen
    dec edx
    int 0x80
    
    pop eax     ;multiplican't
    pop ebx     ;multiplicand
    mul ebx
    add eax, '0'
    
    ;TESTREMOVEadd eax, 0x000A0000
    
    shl eax, 8 ;make room for () and LF
    add eax, 0x0A290028
    
    push eax
    
    mov ecx, esp
    ;mov [num], eax
    ;mov ecx, num 
    
    mov eax, sys_write
    mov ebx, stdout
    mov edx, 4
    int 0x80
    
exit:
    mov eax, sys_exit
    mov ebx, 0
    int 0x80
    
get:
    push ebp     ;added
    mov ebp, esp ;added
    mov eax, sys_read ;3
    mov ebx, stdin    ;0
    mov ecx, num
    mov edx, 4
    int 0x80
    call rstrip
    ;xor eax, eax ;don't think this is necessary
    movzx eax, byte[num]
    sub al, '0'
    ;pop edx ;get call's ret addr out of the way
    ;push eax
    ;push edx
    pop ebp
    ret
    
rstrip:
    dec     eax  ;convert 1-based length to 0-based pointer
.loop:
    cmp     byte [ecx + eax], 0xa
    je      .chop
    cmp     byte [ecx + eax], 0xc
    je      .chop
    cmp     byte [ecx + eax], 0xd
    je      .chop
    
.done:
    inc     eax  ;convert pointer back to length
    ret
    
.chop:
    mov     byte [ecx + eax], 0
    dec     eax
    jns     .loop
    jmp     .done
