	global rindex
	section .txt

rindex:
	xor rax, rax
	xor rcx, rcx

	cmp rdi, 0
	je end_loop
	
get_length:
	cmp BYTE [rdi + rcx], 0
	je loop

	inc rcx
	jmp get_length
	
loop:
	cmp rcx, -1
	je end_loop
	
	cmp BYTE [rdi + rcx], sil
	je define_ret

	dec rcx
	jmp loop

define_ret:
	lea rax, [rdi + rcx]	; lea returned the address of [rdi + rcx]
	jmp end_loop
	
end_loop:
	ret
