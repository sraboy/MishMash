//Modified from: https://www.linuxvoice.com/be-a-kernel-hacker/
//License: GPL

#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>

int main(int argc, char ** argv) {
    int fd = open("/dev/reverse", O_RDWR);

    if(argc == 2) {
        printf("Word: %s\t\t", argv[1]);
        write(fd, argv[1], strlen(argv[1]));
        read(fd, argv[1], strlen(argv[1]));
        printf("Read: %s\n", argv[1]);
        return 0;
    }
    
    char *phrase = "are you as clever as i am";
    int len = strlen(phrase);
    if(fork()) {
        while(1) {
            write(fd, phrase, len);
            sleep(1);
        }
    } else {
        char buf[len + 1];
        while(1) {
            read(fd, buf, len);
            printf("Word: %s?\t\t", phrase);
            printf("Read: %s?\n", buf);
            sleep(1);
        }
    }
}
