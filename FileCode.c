#include <sys/types.h>
#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char *argv[]);

#define BUF SIZE 4096
#define OUTPUT MODE 0700
int main(int argc, char *argv[])
{
    int in fd, out fd, rd count, wt count;
    char buffer[BUF SIZE];
    if (argc != 3)
        exit(1);

    in fd = open(argv[1], O RDONLY);
    if (in fd < 0)
        exit(2);
	out fd = creat(argv[2], OUTPUT MODE);
    if (out fd < 0)
        exit(3);

    while (TRUE)
    {
        rd count = read(in fd, buffer, BUF SIZE);
        if (rd count <= 0)
            break;
		wt count = write(out fd, buffer, rd count);
        if (wt count <= 0)
            exit(4);
    }
close(in fd);
close(out fd);
if (rd count == 0)
    exit(0);
else
    exit(5);
}
