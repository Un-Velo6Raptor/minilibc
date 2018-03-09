	global strchr
	section .txt

strchr:
	xor rcx, rcx
	xor rax, rax

loop:
	cmp BYTE [rdi + rcx], 0
	je end_loop

	cmp BYTE [rdi + rcx], sil
	je define_ret

	inc rcx
	jmp loop

define_ret:
	lea rax, [rdi + rcx]	; lea returned the address of [rdi + rcx]
	jmp end_loop
	
end_loop:
	ret
