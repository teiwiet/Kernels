ORG 0x7c00
BITS 16

_start:
	jmp short start
	nop
times 33 db 0

setup:
	cli 
	xor ax,ax
	mov ds,ax
	mov es,ax
	mov ss,ax
	mov sp,0x7c00
start:
	mov si,message
	call print
	jmp $
print:
	lodsb 
	cmp al,0
	jz done
	mov ah,0eh
	int 0x10
	jmp print

done:
	ret


message : db "Hello, my name is viet",0
times 510-($-$$) db 0
dw 0xAA55
