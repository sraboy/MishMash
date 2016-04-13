# Setup
On Debian Jessie (8.4), you can follow this: http://wiki.osdev.org/GCC_Cross-Compiler. It's easy to just get binutils from the repo: `apt-get source binutils` but don't do that for GCC. Get GCC from the GNU site and then use the recommendation in the tutorial to use `contrib/download_prerequisites`.

Don't forget to `source ~/.bashrc` after adding `export PATH="$HOME/opt/cross/bin:$PATH"` to your bashrc.

Set up your directories however you like (see the tutorial for recommendations) and you can set up with this:

`../binutils-2.25/configure --target=$TARGET --prefix="$PREFIX" --with-sysroot --disable-nls --disable-werror`

`../gcc-5.3.0/configure --target=$TARGET --prefix="$PREFIX" --disable-nls --enable-languages=c,c++ --without-headers`

# Build

See: http://wiki.osdev.org/Bare_Bones. Cheat sheet:

`nasm -felf32 boot.asm -o boot.o`
`i686-elf-gcc -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra`
`i686-elf-gcc -T linker.ld -o myos.bin -ffreestanding -O2 -nostdlib boot.o kernel.o -lgcc`

# Run

In my VirtualBox VM (amd64 Debian guest on amd64 Win10 host), it's still possible to run qemu:

`qemu-system-i386 -kernel myos.bin`

If that's the case, GRUB isn't needed. Otherwise, see the tutorial for building an ISO and booting that with qemu.
