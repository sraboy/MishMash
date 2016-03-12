/*
 * Title: smc64 (Self-Modifying Code)
 * Author: Steven Lavoie, 2016
 * License: GPLv3 (http://www.gnu.org/licenses/gpl-3.0.html)
 * Compiled with gcc version 4.9.2 (Debian 4.9.2-19):
 *  gcc -std=c11 -Wall -ggdb3 -o smc smc.c
 * References:
 *  GCC Asm Ref: https://www.ibiblio.org/gferg/ldp/GCC-Inline-Assembly-HOWTO.html
 *  Idea From: https://gist.github.com/anonymous/e486705dc16c3a687d3f
*/

#include <sys/mman.h> //for PROT_* constants
#include <unistd.h>   //for _SC_PAGESIZE
#include <stdio.h>
#include <string.h>   //for memcpy()

extern int add(int x, int y);

int main()
{
    size_t pagesize = sysconf(_SC_PAGESIZE);
    printf("----------------------\n");
    printf("Page Size: %zd\n", pagesize);
    int add_addr = (unsigned int)&add;
    printf(" Add Func: %08x\n", add_addr);  //
    add_addr %= 4096;
    printf(" add\%4096: %d\n", add_addr);
    int ptr = (&add - add_addr);
    printf("      Ptr: %d\n", ptr);
    printf("----------------------\n\n");
    
    if(mprotect(ptr, 4096, PROT_EXEC | PROT_WRITE | PROT_READ))
    {
        perror("mprotect");
        printf("Fail.\n");
        return -1;
    }
    
    int left = 3, right = 5;
    printf("Add: %d + %d = %d     ", left, right, add(left, right));
    printf("Modifying code...\n");

    int sub = 0x29;
    memcpy(add+18, &sub, 1);
    printf("Sub: %d - %d = %d\n", left, right, add(left, right));

    return 0;
}

int add(int x, int y)
{
    // Disassembly of this function:
    // │0x4007f3 <add>        push   rbp                    
    // │0x4007f4 <add+1>      mov    rbp,rsp                
    // │0x4007f7 <add+4>      mov    DWORD PTR [rbp-0x4],edi
    // │0x4007fa <add+7>      mov    DWORD PTR [rbp-0x8],esi
    // │0x4007fd <add+10>     mov    edx,DWORD PTR [rbp-0x4]
    // │0x400800 <add+13>     mov    ecx,DWORD PTR [rbp-0x8]
    // │0x400803 <add+16>     nop                           
    // │0x400804 <add+17>     nop                           
    // │0x400805 <add+18>     add    ecx,edx                
    // │0x400807 <add+20>     mov    eax,ecx                
    // │0x400809 <add+22>     nop                           
    // │0x40080a <add+23>     nop                           
    // │0x40080b <add+24>     pop    rbp                    
    // │0x40080c <add+25>     ret                           

    // Line to change (with opcodes):
    // │0x400805 <add+18>: 01 d1   add    ecx,edx           
    // Change it to:
    // │0x400805 <add+18>: 29 d1   sub    ecx,edx           

    // The below is essentially: return x + y;
    __asm__ volatile              //volatile = don't move/optimize this code
           ( "nop\n\t"            //just an easy way to identify these
             "nop\n\t"            //instructions in a debugger
             "addl %0, %1\n\t"
             "movl %1, %%eax\n\t"
             "nop\n\t"
             "nop\n\t"
           :                      //output vars (none)
           : "r"(x), "r"(y)       //input vars (x and y), put each in some(any) register
           : "%eax");             //tell GCC not to use eax since I screw it up
    
    //No return statement needed, even though GCC complains. This is because
    //the calling convention says that the return value should be in EAX and
    //we've already taken care of that in the assembly.
}
