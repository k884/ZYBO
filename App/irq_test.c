#include <unistd.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>

#define MEM_BASE	(0x43c00000)
#define SIZE            (0x10000)

void main(int argc, const char * argv[]){
	int fd;
	int i;
	unsigned int *buf;

	// dev/mem open
	fd = open("/dev/mem", O_RDWR);
	if(fd < 0){
		printf("can't open device\n");
		return;
	}

	// mmap
	buf = mmap(NULL, SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, MEM_BASE);
	if(buf == MAP_FAILED){
		printf("can't mmap");
		return;
	}

	buf[0] = 0x1;		// 1'b1 = LED EN 1'b0 = Desable
	buf[1] = 0x1000000;	// 32 bit LED Counter

	munmap(buf, SIZE);
	close(fd);

}
