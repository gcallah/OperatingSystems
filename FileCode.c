#include <sys/types.h>                    /* include necessary header files */
#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>
int main(int argc, char *argv[]);         /* ANSI prototype */
#define BUF SIZE 4096                    /* use a buffer size of 4096 bytes */
#define OUTPUT MODE 0700 				/* protection bits for output file */
int main(int argc, char *argv[])
{
int in fd, out fd, rd count, wt count;
char buffer[BUF SIZE];
if (argc != 3) exit(1); 				/* syntax error if argc is not 3 */

/* Open the input file and create the output file */
in fd = open(argv[1], O RDONLY); 		/* open the source file */
if (in fd < 0) exit(2);					 /* if it cannot be opened, exit */
	out fd = creat(argv[2], OUTPUT MODE); /* create the destination file */
if (out fd < 0) exit(3);			 /* if it cannot be created, exit */

/* Copy loop */
while (TRUE) {
	rd count = read(in fd, buffer, BUF SIZE); /* read a block of data */
	if (rd count <= 0) break; 			/* if end of file or error, exit loop */
		wt count = write(out fd, buffer, rd count); /* wr ite data */
	if (wt count <= 0) exit(4); 		/* wt count <= 0 is an error */
}

/* Close the files */
close(in fd);
close(out fd);
if (rd count == 0) 					/* no error on last read */
exit(0);
else
exit(5);
}