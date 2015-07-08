CC = arm-xilinx-linux-gnueabi-gcc
CFLAGS = -g

all : irq_test 

irq_test : irq_test.o
	$(CC) $(CFLAGS) $^ -o $@

clean :
	rm -rfv *.o
	rm -rfv irq_test

.PHONY : clean
