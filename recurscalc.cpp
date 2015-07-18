/************************************************
* Just some practice with matrices.
*
* I release this code into the public domain.
************************************************/

#include <iostream>
#include <math.h>
#include <iostream>
#include <cstdlib>
#include <string.h>
#include <vector>
#include <fstream>
#include <sstream>

using namespace std;

class matrix {

    vector<int> body;
    int width, height;

public:

    //constructor fills array with zeroes
    matrix(int h, int w) {
        width = w;
        height = h;
        body.resize(w*h,0);
    }

    //setter
    void set(int x, int y, int value) {
        body[y*width+x] = value;
    }
    //getter
    int get(int x, int y) {
        return body[y*width+x];
    }
    //get width
    int get_width() {
        return width;
    }
    //increments the value at an array location
    void increment(int y, int x, int value) {
        body[y*width+x] += value;
    }
};


int get_det(matrix matrix_a,int width)
{

    int det;

    if ((width-1) == 2)
    {
        det = (matrix_a.get(0,0)*matrix_a.get(1,1) -matrix_a.get(1,0)*matrix_a.get(0,1));
        return det;
    }

    for (double x_counter = 1; x_counter < (width-1); x_counter++)
    {
        matrix matrix_b(width-2,width-2);

        for (int x = 0; x < (width-2); x++){

            for (int y = 0; y <(width-2); y++ )
            {
                if (y == (x_counter -1))
                {
                    y++;
                    matrix_b.set(x,y,(matrix_a.get(x_counter,y)));

                }
                else
                    matrix_b.set(x,y,(matrix_a.get(x_counter,y)));
            }
        }

      det = det + matrix_a.get(0,x_counter-1);
      det *= pow(-1,x_counter-1);
      det *= get_det(matrix_b,width-1);
    }

    return det;

}

int main()
{

    matrix matrix(5,5);



    for(int n =0; n<5; n++)
    {


        for (int m=0; m<5; m++)
        {
            matrix.set(m,n,((n+1)*(m+1)));
            cout << "Position @ (x,y) (" << n << "," << m << " ) Value is: " << ((n+1)*(m+1)) << "\n";



        }

    }
    int det = get_det(matrix,5);

    cout << "the Det is" << det;

    return 0;
}
