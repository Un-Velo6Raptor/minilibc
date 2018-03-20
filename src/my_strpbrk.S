	global strpbrk
	section .txt

strpbrk:
	xor rcx, rcx
	xor rax, rax

loop:
	cmp BYTE [rdi + rcx], 0
	je end_loop

	jmp start_check
carry_on_loop:	
	
	inc rcx
	jmp loop

start_check:
	xor r8, r8

loop_check:	
	cmp BYTE [rsi + r8], 0
	je carry_on_loop

	mov r10b, [rsi + r8]
	cmp BYTE [rdi + rcx], r10b
	je define_ret
	
	inc r8
	jmp loop_check
	
	
define_ret:
	lea rax, [rdi + rcx]	; lea returned the address of [rdi + rcx]
	jmp end_loop
	
end_loop:
	ret
