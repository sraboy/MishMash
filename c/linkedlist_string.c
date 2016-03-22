struct node {
    char ch;
    struct node * next;
};

typedef struct node string[255];

int main(int argc, char * argv[])
{
    //struct node *head;
    //head = (struct node *) malloc(sizeof(struct node));

    //head->next = 0;
    //head->ch = 'H';

    string * helloworld = (struct node *) malloc(255 * sizeof(struct node));
    
    helloworld[0]->ch = 'H';
    helloworld[0]->next = helloworld[1];
    helloworld[1]->ch = 'e';
    helloworld[1]->next = helloworld[2];
    helloworld[2]->ch = 'l';
    helloworld[2]->next = helloworld[3];
    helloworld[3]->ch = 'l';
    helloworld[3]->next = helloworld[4];
    helloworld[4]->ch = 'o';
    helloworld[4]->next = helloworld[5];
    helloworld[5]->ch = ' ';
    helloworld[5]->next = helloworld[6];
    helloworld[6]->ch = 'W';
    helloworld[6]->next = helloworld[7];
    helloworld[7]->ch = 'o';
    helloworld[7]->next = helloworld[8];
    helloworld[8]->ch = 'r';
    helloworld[8]->next = helloworld[9];
    helloworld[9]->ch = 'l';
    helloworld[9]->next = helloworld[10];
    helloworld[10]->ch = 'd';
    helloworld[10]->next = helloworld[11];
    helloworld[11]->ch = '!';
    helloworld[11]->next = 0;
    
    printline(helloworld);
}

int printline(string * str)
{
    int i = 0;
    
    while(1)
    {
        char c = str[i]->ch;
        putchar(c);
        i++;
        
        if(str[i]->next == 0)
        {
            char c = str[i]->ch;
            putchar(c);
            putchar('\n');
            return 0;
        }
    }
}
