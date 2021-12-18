clean:
	mkdir build

	gcc -ffreestanding -c kernel/kernel.c -o build/kernel.o
	nasm boot_sector/kernel_entry.s -f elf64 -o build/kernel_entry.o
	nasm boot_sector/bootsect.s -f bin -o build/bootsect.bin
	ld -o build/kernel.bin -Ttext 0x1000 build/kernel_entry.o build/kernel.o --oformat binary
	cat build/bootsect.bin build/kernel.bin > build/os-image.bin
	qemu-system-x86_64 -fda build/os-image.bin

	rm build/*.bin build/*.o
	rmdir build


