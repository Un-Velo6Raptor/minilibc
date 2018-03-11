	global strcmp
	section .text

strcmp:
	xor rcx, rcx
	xor rax, rax

loop:
	cmp BYTE [rdi + rcx], 0
	je str_end

	cmp BYTE [rsi + rcx], 0
	je str_end

	mov r8b, [rsi + rcx]
	cmp BYTE [rdi + rcx], r8b
	jne diff_occurs
	
	inc rcx
	jmp loop


str_end:
	mov r8b, [rsi + rcx]
	cmp BYTE [rdi + rcx], r8b
	je end_loop
	
diff_occurs:
	xor r9b, r9b
	
	sub r9b, r8b
	add r9b, [rdi + rcx]
	mov al, r9b
	
end_loop:
	ret
