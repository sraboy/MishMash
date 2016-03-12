#include <stdio.h>
#include <strings.h>
#include <stdlib.h>
#include <sys/time.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>

void InitGame();
void PrintBoard();
void GameLoop();
void ProcessAI();
char GetPosition(int pos);

int board[9];
int aiOn;

int main()
{
    InitGame();

    //setup
    printf("You are X. AI is O.\n");

    //game
    GameLoop();

    return 0;
}

void GameLoop()
{
    while(1)
    {
        PrintBoard();
        printf("Place an X [0-8]: ");
        int pos;
        scanf("%u", &pos);
        
        if(pos < 9 && pos > -1)
        {
            if(GetPosition(pos) == ' ')
                board[pos] = -1;
            else
                break;
        }
        else
        {
            return;
        }

        ProcessAI();
    }
}

void ProcessAI()
{
    int pos = rand() % 9;

    if(GetPosition(pos) == ' ')
        board[pos] = 1;
    else
        ProcessAI();
}

void InitGame()
{
    struct timeval tv;
    gettimeofday(&tv, NULL);
    srand(tv.tv_usec * tv.tv_sec);
    bzero(board, 9);

    printf("1: Single player\n2: Multiplayer");
    int choice;
    scanf("%d", &choice);
    switch(choice)
    {
        case 1:
            aiOn = 1;
            break;
        case 2:
            aiOn = 0;
            break;
        default:
            exit(0);
    }
}

void Server()
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    struct sockaddr_in serv_addr, cli_addr;
    serv_addr.sin_family = AF_INET;
    serv_addr.sin_addr.s_addr = INADDR_ANY;
    serv_addr.sin_port = htons(10000);

    if(bind(sockfd, (struct sockaddr *) &serv_addr, sizeof(serv_addr)) < 0)
        printf("Failed to bind socket to address!");

    listen(sockfd, 5);
    int clilen = sizeof(cli_addr);
    int newsockfd = accept(sockfd, (struct sockaddr *) &cli_addr, &clilen);
    char buf[256];
    bzero(buf,256);
    int bytes = read(newsockfd, buf, 255);
    printf("Message: %s\n", buf);
    bytes = write(newsockfd, "Received");
    close(newsockfd);
    close(sockfd);
}

void PrintBoard()
{
    printf("_______\n");
    printf("|%c|%c|%c|\n", GetPosition(0), GetPosition(1), GetPosition(2));
    printf("|%c|%c|%c|\n", GetPosition(3), GetPosition(4), GetPosition(5));
    printf("|%c|%c|%c|\n", GetPosition(5), GetPosition(6), GetPosition(7));
    printf("¯¯¯¯¯¯¯\n");
}

char GetPosition(int pos)
{
    switch(board[pos])
    {
        case -1:
            return 'X'; //player
            break;
        case 1:
            return 'O'; //AI
            break;
        default:
            return ' '; //unplayed
            break;
    }
}
