	global memset
	section .text

memset:
	xor rcx, rcx

loop:
	cmp rcx, rdx
	je end_loop

	mov [rdi + rcx], sil
	
	inc rcx
	jmp loop

end_loop:
	mov rax, rdi
	ret
