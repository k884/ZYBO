BUILD_DIR := $(shell pwd)
obj-m := myled.o

all:
	make -C ../Linux-Digilent-Dev/ M=$(BUILD_DIR) modules

clean:
	make -C ../Linux-Digilent-Dev/ M=$(BUILD_DIR) clean
