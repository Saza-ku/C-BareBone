.PHONY: build
build: myos.bin

myos.bin: boot.o kernel.o
	ld -m elf_i386 -T linker.ld -o myos.bin boot.o kernel.o

boot.o:
	nasm -felf32 boot.asm -o boot.o

kernel.o:
	zig build-obj kernel.c -target i386-freestanding

.PHONY: clean
clean:
	rm kernel.o boot.o myos.bin
