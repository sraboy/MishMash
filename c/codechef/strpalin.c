#include <stdio.h>
#include <string.h>

typedef struct testcase
{
    char a[1001];
    char b[1001];
    
} testcase_t;

int main()
{
    int testcases = 0;
    scanf("%d", &testcases);

    testcase_t cases[testcases];
    
    for(int i = 0; i < testcases; i++)
    {
        scanf("%s", &cases[i].a);
        scanf("%s", &cases[i].b);
    }

    for(int t = 0; t < testcases; t++)
    {
        int match = 0;
        int alen = strlen(cases[t].a);
        int blen = strlen(cases[t].b);

        for(int i = 0; i < alen; i++)
        {
            for(int j = 0; j < blen && match == 0; j++)
            {
                //only need to find a single matching letter
                if(cases[t].a[i] == cases[t].b[j])
                {
                    match = 1;
                    break;
                }
            }
        }

        if(match)
        {
            printf("Yes\n");
        }
        else
        {
            printf("No\n");
        }
    }
}
