[org 0x7c00]

start:
    mov si, message
    call print_string

    mov bx, 0x8000       ; load address
    mov dh, 0
    mov dl, 0x00         ; first floppy disk A:
    mov ch, 0
    mov cl, 2            ; sector 2 (kernel start)
    mov al, 11            ; number of sectors to read

    call read_sectors

    jmp 0x0000:0x8000    ; jump to kernel

read_sectors:
    push ax
    push bx
    push cx
    push dx
    push es
    mov ax, 0x0000
    mov es, ax

    mov ah, 0x02         ; BIOS read sectors
    int 0x13
    jc load_error

    pop es
    pop dx
    pop cx
    pop bx
    pop ax
    ret

load_error:
    mov si, err_msg
    call print_string
    cli
    hlt
    jmp $

print_string:
    lodsb
    or al, al
    jz done
    mov ah, 0x0e
    int 0x10
    jmp print_string
done:
    ret

message db 'Bootloader works!', 0
err_msg db 'Disk read error!', 0

times 510 - ($ - $$) db 0
dw 0xAA55
