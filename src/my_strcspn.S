	global strcspn
	section .txt

strcspn:
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
	je end_loop

	inc r8
	jmp loop_check
	
end_loop:
	mov rax, rcx
	ret
