/***********************************************************************
* I was trying to "make it rain" in a console, without using curses or
* any other libs. This was one of those language-familiarization deals
* where I wanted to avoid libraries. It doesn't quite do what I imagined
* but I learned that it's not really possible with ANSI C. As usual,
* reddit came to the rescue with some help: https://www.reddit.com/r/Cplusplus/comments/27yd9v/help_with_pi_and_limitations_on_c_and_x64
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.

* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY* without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.

* You should have received a copy of the GNU General Public License
* along with this program.  If not, see <http://www.gnu.org/licenses/>. 
***********************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <time.h>

const int rainHeight = 24, rainWidth = 80;

void MakeItRain(char *);
void ShowMeRain(char *);

int main()
{
    srand(time(NULL));
    int r;

    char rain[rainWidth][rainHeight];
    //rain = malloc(sizeof(char)*rainHeight*rainWidth);

    printf("\n"); //want to keep alignment even with the debugger output

    //initialize a storm cloud
    for(int y = 0; y < rainHeight; y++)
    {
        for(int x = 0; x < rainWidth; x++)
        {
            r = rand() % 100;
            if(r%8 == 1)
                rain[x][y] = '1';
            else
                rain[x][y] = '0';
        }

    }

    while(1)
    {
        ShowMeRain((char*) rain);
        MakeItRain((char*) rain);
    }


    return 0;
}

void ShowMeRain(char * rain)
{
    struct timespec tim;
    tim.tv_sec = 0;
    tim.tv_nsec = 20000000L;

    for(int x = 0; x < rainHeight; x++)
    {
        for(int y = 0; y < rainWidth; y++)
        {
            if(rain[x*y] == '0')
                printf(" ");
            else
                printf("%c", rain[x*y]);
        }

        printf("\n");
        nanosleep(&tim, NULL);
    }
    //tim.tv_nsec *= 20L;
    //nanosleep(&tim, NULL);
    //for(int x = 0; x < (rainHeight*rainWidth)+rainHeight*5; x++)
    //{
    //    printf("\b");
    //}
    //printf("About to sleep...\n");
    //sleep(5);
    //printf("Slept for 5s\n");
    printf("%c[2H",27);
    //printf("Moved the cursor? Sleeping again.\n");
    //sleep(5);
    //printf("Slept for 5 more seconds.\n");

}

void MakeItRain(char * oldrain)
{
    char * newrain = malloc(sizeof(char)*rainWidth*rainHeight); //[rainWidth][rainHeight];
    memcpy(newrain+rainWidth, oldrain, (rainWidth*rainHeight)-rainWidth);

    int r;

    for(int x = 0; x < rainWidth; x++)
    {
        r = rand() % 100;
        if(r%4 == 1)
            newrain[/*(rainHeight - 1) * */ x] = '1';
        else
            newrain[/*(rainHeight - 1) * */ x] = '0';
    }

    memcpy(oldrain, newrain, (rainWidth*rainHeight));
}

