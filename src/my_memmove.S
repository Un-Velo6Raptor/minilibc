	global memmove
	section .text

memmove:
	xor rcx, rcx

loop:
	cmp rcx, rdx
	je end_loop

	mov r8b, [rsi + rcx] 	; tmp value contains the char to set
	mov [rdi + rcx], r8b	; set the char stocked before
	
	inc rcx
	jmp loop

end_loop:
	mov rax, rdi
	ret
