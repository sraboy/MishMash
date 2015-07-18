/***********************************************************************
* This "multi_code" project was just me testing out some very simple
* operations in various languages. The goal was to have each code 
* snippet take the same exact input and produce the same exac output.
* The "input.txt" file is just two integers that are piped into each
* binary, which multiplies them and prints the result.
* 
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

int main()
{
    int a,b,solution;
    
    printf("Enter the first integer: ");
    scanf("%d", &a);
    
    printf("Enter the second integer: ");
    scanf("%d", &b);
    
    solution = a*b;
    
    printf("Result: %d\n", solution);

    return 0;
}
