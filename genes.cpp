/***********************************************************************
* This was just a quick project to get reacquainted with C++ after a
* hiatus so there's nothing special going on here, really.
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

#include <string>
#include <iostream>
#include <stdlib.h>

using namespace std;

static const char nucleotides[] = {"ATCG"};

class Gene {

public:
    string left_strand;
    string right_strand;

    Gene(){  }
    Gene(int base_pair_count)
    {
        left_strand = string(base_pair_count, ' ');
        right_strand = string(base_pair_count, ' ');

        for(int i = 0; i < base_pair_count; i++)
        {
            left_strand[i] = nucleotides[rand() % (sizeof(nucleotides)-1)];
        }

        right_strand = build_strand(left_strand);
    }


private:
    string build_strand(string source_strand)
    {
        string strand_to_build(source_strand.length(), ' ');
        char a = 'A', t = 'T', c = 'C', g = 'G';

        for(int i = 0; i < source_strand.length(); i++)
        {
            if(source_strand[i] == a)
                strand_to_build[i] = t;
            if(source_strand[i] == t)
                strand_to_build[i] = a;
            if(source_strand[i] == c)
                strand_to_build[i] = g;
            if(source_strand[i] == g)
                strand_to_build[i] = c;
        }

        return strand_to_build;
    }
};

struct Chromosome {
    Gene * genes;

    Chromosome(int gene_count, int base_pair_count)
    {
        genes = new Gene[gene_count];
        for(int i = 0; i < gene_count; i++)
            genes[i] = Gene(base_pair_count);
    }
};

int main()
{
    Chromosome * cm = new Chromosome(5, 20);

    for(int i = 0; i < 5; i++)
    {
        cout << cm->genes[i].left_strand << endl;
        cout << cm->genes[i].right_strand << endl;
    }


    return 0;
}


