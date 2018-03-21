	global strstr
	section .txt

strstr:
	xor rcx, rcx
	xor rax, rax

	cmp BYTE [rdi], 0
	jne loop
	cmp BYTE [rsi], 0
	je define_ret
	
loop:
	cmp BYTE [rdi + rcx], 0
	je end_loop

	jmp start_check
carry_on_loop:	
	
	inc rcx
	jmp loop

start_check:
	mov r8, rcx
	xor r9, r9

loop_check:	
	cmp BYTE [rsi + r9], 0
	je define_ret

	mov r10b, [rsi + r9]
	cmp BYTE [rdi + r8], r10b
	jne carry_on_loop
	
	inc r8
	inc r9
	jmp loop_check
	
	
define_ret:
	lea rax, [rdi + rcx]	; lea returned the address of [rdi + rcx]
	jmp end_loop
	
end_loop:
	ret
