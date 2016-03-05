// Released into the public domain. -Steven Lavoie, 2016
#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>

int main(int argc, char *argv[])
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
    return 0;
}
