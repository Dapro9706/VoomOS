all:
	nasm kernel_entry.s -f elf -o boot.o
	gcc -ffreestanding -c kernel.c -o kernel.o
	ld -o kernel.bin -Ttext 0x1000 kernel_entry.o kernel.o --oformat binary
	nasm bootsect.s -f bin -o bootsect.bin
	cat bootsect.bin kernel.bin > os-image.bin
	qemu-system-x86_64 os-image.bin
