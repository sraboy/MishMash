/*
* Write a program that prints the numbers from 1 to 100. But for multiples of three print “Fizz” instead
* of the number and for the multiples of five print “Buzz”. For numbers which are multiples of both three
* and five print “FizzBuzz”.
*
* C99 or better required for embedded initial declarations in for loop
*/

#include <stdio.h>

int main()
{
    //nice and explicit
    for(int x = 1; x <= 100; x++)
    {
        if ((x % 5 == 0) && (x % 3 == 0))
            printf("FizzBuzz  ");
        else if (x % 5 == 0)
            printf("Buzz  ");
        else if (x % 3 == 0)
            printf("Fizz  ");
        else
            printf("%d  ", x);
    }

    printf("\n\n");

    //more implicit but shorter
    for(int x = 1; x <= 100; x++)
    {
        if(x % 3 == 0)
            printf("Fizz");
        if(x % 5 == 0)
            printf("Buzz");
        if(x % 3 != 0 && x % 5 != 0)
            printf("%d", x);
    }
    
    return 0;
}
