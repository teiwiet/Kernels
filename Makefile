FILES = ./build/kernel.asm.o


all: ./bin/boot.bin %(FILES)
	dd if =./bin/boot.bin >> ./bin/os.bin


./bin/boot.bin: ./src/boot/boot.asm
	nasm -f bin ./src/boot/boot.asm -o ./bin/boot.asm
	

./build/kernel.asm.o: ./src/kernel.asm 
	nasm -f elf -g ./src/kernel.asm/ -o ./build/kernel.asm.o 
clean:
	rm -rf ./bin/boot.bin
