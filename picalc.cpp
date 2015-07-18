/************************************************
* Just some practice with floating point numbers.
* Got some help from Reddit: https://www.reddit.com/r/Cplusplus/comments/27yd9v/help_with_pi_and_limitations_on_c_and_x64
*
* I release this code into the public domain.
************************************************/

#include <iostream>
#include <cstdlib>
#include <iomanip>
#include <limits>
#include <cmath>

long double calc();

int main(int argc, char* argv[])
{
    std::cout << sizeof(short) << std::endl;

    // output of 16 means 128-bit floating point
    //std::cout << sizeof(long double) << " " << std::numeric_limits<long double>::digits;
    //std::cin.ignore().get();

    unsigned long limit = 0;

    if(argc > 1)
    {
        limit = strtol(argv[1], 0, 10);
    }
    else
    {
        std::cout << "To what digit shall I calculate pi? ";
        std::cin >> limit;
    }

    std::cout << "long double Pi = " << std::setprecision(limit) << calc() << std::endl;
    std::cout << "       acos Pi = " << acos(-1.0L) << std::endl;
    std::cout << "      acosl Pi = " << acosl(-1.0L) << std::endl;

    std::cin.ignore().get();
    return 0;
}

long double calc()
{
    unsigned long max = std::numeric_limits<unsigned long>::max();
    long double pi = 3.0L;
    long double a=2.0L;
    long double stopper[2] {0L, 0L};
    unsigned long i = 0;

    for(; i < max; i++)
    {
        if(i % 2 == 0) //if even
            pi += 4.0L/((a)*(a+1.0L)*(a+2.0L));
        else
            pi -= 4.0L/((a)*(a+1.0L)*(a+2.0L));

        /* Precision testing. Eventually, long double
         * will cease having the space to actually calculate
         * any further and it will become useless to
         * continue with the calculations. Simply check
         * if the current calculation of pi is equal to
         * either of the last two. If it is, break.
         */
        if(pi == stopper[0] ||
           pi == stopper[1])
               break;
        else
        {
            stopper[0] = stopper[1];
            stopper[1] = pi;
        }

        a+=2.0L;
    }

    std::cout << i << " iterations completed!\n";
    return pi;
}
