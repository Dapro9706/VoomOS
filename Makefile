all:
	nasm -f bin boot_sec_main.s -o boot.bin
	qemu-system-x86_64 boot.bin

c_test:
	gcc -ffreestanding -c main.c -o main.o
	ld -o main.bin -Ttext 0x0 --oformat binary main.o