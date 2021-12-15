all:
	mkdir build

	gcc -ffreestanding -c kernel/kernel.c -o build/kernel.o
	nasm boot_sector/kernel_entry.asm -f elf -o build/kernel_entry.o
	nasm boot_sector/bootsect.asm -f bin -o build/bootsect.bin
	ld -o kernel.bin -Ttext 0x1000 build/kernel_entry.o build/kernel.o --oformat binary
	cat build/bootsect.bin build/kernel.bin > build/os-image.bin
	qemu-system-x86_64 -fda build/os-image.bin

	cd build
	rm *.bin, *.o
	cd ..
	rmdir build


