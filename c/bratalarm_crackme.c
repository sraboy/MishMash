/*
This file is part of Bratalarm Crackme Tutorial
See my tutorial here: http://www.daffysduck.com/posts/bratalarm_crackme_part_i
*/

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

unsigned int subChangeQWORD(char *);
int sub_4011F1(int arg_0, int arg_4);
int * sub_40128A(int a, int b, int c, int d, int * results);

unsigned int szSerialNum_alt1, szSerialNum_alt2, szSerialNum_alt3, szSerialNum_alt4;

int main(void) 
{
    /*
    int * results = malloc(sizeof(int)*2);
    sub_40128A(2, 3, 4, 5, results);
    printf("results[1] is %d\nresults[2] is %d\n", results[1], results[2]);
    return 0;
    */
    
    unsigned int szSerialNum_alt1;
    unsigned int szSerialNum_alt2;
    unsigned int szSerialNum_alt3;
    unsigned int szSerialNum_alt4;
    
    const int iterations = 4;
    char serial[35] = "serialnumbergoesherenowandstuffyay!";
    char substring[9];
    int offset = 0;
    int i;

    //printf("%s is %x\n", stringQWORD, subChangeQWORD("serialnum"));

    //Loop is inlined at 0x40111A
    for(i = 0; i < iterations; i++)
    {
        strncpy(substring, serial+offset, 8);
        substring[8] = '\0';
        printf("%s:\n", substring);
        offset += 9;
        switch(iterations)
        {
            case 1:
                szSerialNum_alt1 = subChangeQWORD((char *)substring);
                break;
            case 2:
                szSerialNum_alt2 = subChangeQWORD((char *)substring);
                break;
            case 3:
                szSerialNum_alt3 = subChangeQWORD((char *)substring);
                break;
            case 4:
                szSerialNum_alt4 = subChangeQWORD((char *)substring);
                break;
        }
        
    }

    return 0;
}

int sub_4011F1(int arg_0, int arg_4)
{
    int edi = arg_0;  //mov   edi, [ebp+arg_0]
    int esi = arg_4;  //mov   esi, [ebp+arg_4]
    char ebx;         //lea   ebx, [ebp+var_8]
    char ecx;         //lea   ecx, [ebp+var_10]

    //sub_40128A(ebx, esi, esi);
    //sub_40128A(ecx, esi, szSerialNum_alt1);
    //sub_401269(edi, ebx, ecx);
    //sub_401269(edi, edi, szSerialNum_alt3);
}

int * sub_40128A(int a, int b, int c, int d, int * results)
{
    int x, y, ans1, ans2;
    x = a * c;
    y = b * d;
    ans1 = x - y;

    x = a * d;
    y = b * c;
    ans2 = x + y;

    results[1] = ans1;
    results[2] = ans2;
    return results;
}

unsigned int subChangeQWORD(char * stringQWORD)
{    
    const int strlen = 8;       //[0x4012CD] mov ecx, 8
    const int dlSub = 48;       //[0x4012DB] sub dl, 0x30
    const int dlCmp = 10;       //[0x4012DE] cmp dl, 0x0A
    const int dlCmpMaybe = 7;   //[0x4012E3] sub dl, 0x7
    const int eaxSHL = 4;       //[0x4012E6] shl eax, 0x4
    unsigned int eax = 0;       //[0x4012C9] xor eax, eax
    //unsigned int edx = 0;     //[0x4012CB] xor edx, edx

    int i; //Depending on your compiler, this may be embedded in the for loop instead.
    for(i = 0; i < strlen; i++) //since we start at 0, i<strlen will get us through all 8 chars
    {
        unsigned int dl = (unsigned int)stringQWORD[i];   //[0x4012D5] mov dl, [esi]
        printf("dl: %c\t", dl);

        dl -= dlSub;              //[0x4012DB] sub dl, 0x30
        printf("dl - 48: %c\t", dl);

        if(dl == dlCmp)           //[0x4012DE] cmp dl, 0x0A
        {
            printf("Break!\n");
            break;
        }

        dl -= dlCmpMaybe;        //[0x4012E3] sub dl, 0x7
        printf("dl - 7: %c\t", dl);
        
        printf("eax: 0x%08x\t\t", eax);        
        
        eax = eax << eaxSHL;     //[0x4012E6] shl eax, 0x4
        printf("eax << 4: 0x%08x\t", eax);
        
        eax |= dl;               //[0x4012E9] or eax, edx
        
        printf("eax |= dl: 0x%08x\n", eax);
        printf("---------------------------------------------------------------------------------------------------------------\n");
    }

    return eax;  //[0x4012F3] mov eax, [ebp+stringQWORD]
}
