sudo apt update
sudo apt upgrade -y
sudo apt install build-essential nasm qemu-system gcc-multilib binutils -y
mkdir ~/nilanios
cd ~/nilanios
nano boot.asm
nano kernel.c
nano linker.ld
gcc -m32 -ffreestanding -fno-pic -c kernel.c -o kernel.o
ld -m elf_i386 -T linker.ld -o kernel.bin -nostdlib -nostartfiles --oformat binary kernel.o
gcc -m32 -ffreestanding -fno-pic -nostdlib -nostartfiles -Wl,-Tlinker.ld -o kernel.bin kernel.c -Wl,-O,binary
ls -l kernel.bin
nasm -f bin boot.asm -o boot.bin
dd if=boot.bin of=os-image.bin bs=512 count=1 conv=notrunc
dd if=kernel.bin of=os-image.bin bs=512 seek=1 conv=notrunc
qemu-system-x86_64 -drive format=raw,file=os-image.bin
size=$(stat -c%s kernel.bin)
sectors=$(( (size + 511) / 512 ))
echo "Kernel size: $size bytes"
echo "Sectors needed: $sectors"
nano boot.asm
nasm -f bin boot.asm -o boot.bin
dd if=boot.bin of=os-image.bin bs=512 count=1 conv=notrunc
dd if=kernel.bin of=os-image.bin bs=512 seek=1 conv=notrunc
qemu-system-x86_64 -drive format=raw,file=os-image.bin
rm -f boot.bin kernel.o kernel.bin os-image.bin
nano boot.asm
nasm -f bin boot.asm -o boot.bin
gcc -m32 -ffreestanding -fno-pic -nostdlib -nostartfiles -Wl,-Tlinker.ld -o kernel.bin kernel.c -Wl,-O,binary
nasm -f bin boot.asm -o boot.bin
dd if=boot.bin of=os-image.bin bs=512 count=1 conv=notrunc
dd if=kernel.bin of=os-image.bin bs=512 seek=1 conv=notrunc
qemu-system-x86_64 -drive format=raw,file=os-image.bin
dd if=/dev/zero of=os-image.bin bs=512 count=2880
dd if=boot.bin of=os-image.bin bs=512 count=1 conv=notrunc
dd if=kernel.bin of=os-image.bin bs=512 seek=1 conv=notrunc
nano boot.asm
nasm -f bin boot.asm -o boot.bin
qemu-system-x86_64 -fda os-image.bin
qemu-system-x86_64 -fda os-image.bin -drive format=raw,file=os-image.bin
qemu-system-x86_64 -fda os-image.bin -drive format=raw,file=os-image.bi
ps aux | grep qemu
qemu-system-x86_64 -fda os-image.bin
qemu-system-x86_64 -drive format=raw,file=os-image.bin
stat -c%s kernel.bin
echo $(( (5508 + 511) / 512 ))
mov al, 11
mov dl, 0x00   ; floppy disk A:
nano boot.asm
nasm -f bin boot.asm -o boot.bin
dd if=/dev/zero of=os-image.bin bs=512 count=2880
dd if=boot.bin of=os-image.bin bs=512 count=1 conv=notrunc
dd if=kernel.bin of=os-image.bin bs=512 seek=1 conv=notrunc
qemu-system-x86_64 -drive format=raw,file=os-image.bin,if=floppy
nano boot.asm
nasm -f bin boot.asm -o boot.bin
dd if=/dev/zero of=os-image.bin bs=512 count=2880
dd if=boot.bin of=os-image.bin bs=512 count=1 conv=notrunc
dd if=kernel.bin of=os-image.bin bs=512 seek=1 conv=notrunc
qemu-system-x86_64 -fda os-image.bin
sudo apt update
sudo apt install -y build-essential nasm qemu
mkdir ~/myos
cd ~/myos
nano boot.asm
sudo apt update
sudo apt install qemu-system-x86
sudo apt install qemu qemu-kvm qemu-system qemu-utils
sudo apt update
sudo apt install qemu-system-x86 qemu-utils
sudo add-apt-repository universe
sudo apt update
sudo apt install qemu-system-x86 qemu-utils
cd ~/myos
nano boot.asm
nasm -f bin boot.asm -o boot.bin
ls -l boot.bin
nano kernel.c
gcc -m32 -ffreestanding -nostdlib -c kernel.c -o kernel.o
nano linker.ld
ld -m elf_i386 -T linker.ld -o kernel.bin kernel.o --oformat binary
-fno-pic
gcc -m32 -ffreestanding -nostdlib -fno-pic -c kernel.c -o kernel.o
ld -m elf_i386 -T linker.ld -o kernel.bin kernel.o --oformat binary
gcc -m32 -ffreestanding -nostdlib -fno-pic -c kernel.c -o kernel.o
nano linker.ld
ld -m elf_i386 -T linker.ld -o kernel.bin kernel.o --oformat binary
dd if=kernel.bin of=kernel_padded.bin bs=512 conv=sync
dd if=/dev/zero of=floppy.img bs=512 count=2880
dd if=boot.bin of=floppy.img conv=notrunc
dd if=kernel_padded.bin of=floppy.img bs=512 seek=1 conv=notrunc
qemu-system-x86_64 -fda floppy.img
wsl
cd ~/myos
qemu-system-x86_64 -drive file=floppy.img,format=raw,if=floppy
ls -l boot.bin
hexdump -C boot.bin | tail -n 1
times 510 - ($ - $$) db 0
dw 0xAA55
sudo apt update
sudo apt install build-essential nasm qemu-system-x86 gcc-multilib
mkdir ~/myos
cd ~/myos
nano boot.asm
nasm -f bin boot.asm -o boot.bin
ls -l boot.bin   # should be 512 bytes
nano kernel.c
gcc -m32 -ffreestanding -nostdlib -fno-pic -c kernel.c -o kernel.o
nano linker.ld
ld -m elf_i386 -T linker.ld -o kernel.bin kernel.o --oformat binary
ls -l kernel.bin
dd if=kernel.bin of=kernel_padded.bin bs=512 conv=sync
ls -l kernel_padded.bin
dd if=/dev/zero of=floppy.img bs=512 count=2880
dd if=boot.bin of=floppy.img conv=notrunc
dd if=kernel_padded.bin of=floppy.img bs=512 seek=1 conv=notrunc
ls -l floppy.img
qemu-system-x86_64 -drive file=floppy.img,format=raw,if=floppy
ls -l boot.bin
hexdump -C boot.bin | tail -n 1
times 510 - ($ - $$) db 0
dw 0xAA55
nano boot.asm
nasm -f bin boot.asm -o boot.bin
hexdump -C boot.bin | tail -n 1
nano boot.asm
nasm -f bin boot.asm -o boot.bin
hexdump -C boot.bin | tail -n 2
ls -l floppy.img
dd if=/dev/zero of=floppy.img bs=512 count=2880
dd if=boot.bin of=floppy.img conv=notrunc
dd if=kernel_padded.bin of=floppy.img bs=512 seek=1 conv=notrunc
ls -l kernel_padded.bin
dd if=kernel_padded.bin of=floppy.img bs=512 seek=1 conv=notrunc count=N
dd if=kernel_padded.bin of=floppy.img bs=512 seek=1 conv=notrunc
ls -l kernel.bin kernel_padded.bin
dd if=kernel_padded.bin of=floppy.img bs=512 seek=1 conv=notrunc
dd if=/dev/zero of=floppy.img bs=512 count=2880
dd if=boot.bin of=floppy.img conv=notrunc
dd if=kernel_padded.bin of=floppy.img bs=512 seek=1 conv=notrunc
dd if=/dev/zero of=floppy.img bs=512 count=2880
dd if=boot.bin of=floppy.img conv=notrunc
dd if=kernel_padded.bin of=floppy.img bs=512 seek=1 conv=notrunc
qemu-system-x86_64 -drive file=floppy.img,format=raw,if=floppy
dd if=/dev/zero of=floppy.img bs=512 count=2880
dd if=boot.bin of=floppy.img conv=notrunc
dd if=kernel_padded.bin of=floppy.img bs=512 seek=1 conv=notrunc
ls -l kernel_padded.bin
qemu-system-x86_64 -drive file=floppy.img,format=raw,if=floppy
ls -l boot.bin kernel.bin kernel_padded.bin floppy.img
hexdump -C boot.bin | tail -n 10
hexdump -C floppy.img | head -n 40
qemu-system-x86_64 -drive file=floppy.img,format=raw,if=floppy -boot a
qemu-system-x86_64 -fda floppy.img
qemu-system-x86_64 -drive file=floppy.img,format=raw,if=floppy -boot a
start:
nano boot.asm
nasm -f bin boot.asm -o boot.bin
nano boot.asm
nasm -f bin boot.asm -o boot.bin
ls -l boot.bin
dd if=/dev/zero of=floppy.img bs=512 count=2880
dd if=boot.bin of=floppy.img conv=notrunc
dd if=kernel_padded.bin of=floppy.img bs=512 seek=1 conv=notrunc
qemu-system-x86_64 -drive file=floppy.img,format=raw,if=floppy -boot a
hexdump -C boot.bin | tail -n 2
boot.asm
nasm -f bin boot.asm -o boot.bin
nano boot.asm
dd if=/dev/zero of=floppy.img bs=512 count=2880          
dd if=boot.bin of=floppy.img conv=notrunc             
dd if=kernel_padded.bin of=floppy.img bs=512 seek=1 conv=notrunc   
ls -l boot.bin
hexdump -C boot.bin | tail -n 2
qemu-system-x86_64 -drive file=floppy.img,format=raw,if=floppy -boot a
ls -l boot.bin
hexdump -C boot.bin | tail -n 2
nano boot.asm
nasm -f bin boot.asm -o boot.bin
ls -l boot.bin
dd if=/dev/zero of=floppy.img bs=512 count=2880
dd if=boot.bin of=floppy.img conv=notrunc
qemu-system-x86_64 -drive file=floppy.img,format=raw,if=floppy -boot a
qemu-system-x86_64 -fda floppy.img
qemu-system-x86_64 -drive file=floppy.img,format=raw,if=floppy -boot a
nano boot.asm
nasm -f bin boot.asm -o boot.bin
nano kernel.c
gcc -m32 -ffreestanding -nostdlib -fno-pic -c kernel.c -o kernel.o
ld -m elf_i386 -Ttext 0x1000 -o kernel.bin kernel.o --oformat binary
nano kernel.c
gcc -m32 -ffreestanding -nostdlib -fno-pic -c kernel.c -o kernel.o
ld -m elf_i386 -Ttext 0x1000 -o kernel.bin kernel.o --oformat binary
dd if=kernel.bin of=kernel_padded.bin bs=512 conv=sync
dd if=/dev/zero of=floppy.img bs=512 count=2880
dd if=boot.bin of=floppy.img conv=notrunc
dd if=kernel_padded.bin of=floppy.img bs=512 seek=1 conv=notrunc
qemu-system-x86_64 -drive file=floppy.img,format=raw,if=floppy -boot a
mkdir ~/myos
cd ~/myos
nano boot.asm
nasm -f bin boot.asm -o boot.bin
ls -l boot.bin
dd if=boot.bin of=floppy.img bs=512 count=1 conv=notrunc
qemu-system-x86_64 -drive file=floppy.img,format=raw,if=floppy
