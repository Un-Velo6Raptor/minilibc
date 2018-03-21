	global memmove
	section .text

memmove:
	xor rcx, rcx

	cmp rdx, 0
	je end_loop
	
	cmp rsi, rdi
	jbe start_end
		
loop_begin:
	cmp rcx, rdx
	je end_loop
	
	mov r8b, [rsi + rcx]
	mov [rdi + rcx], r8b
		
	inc rcx
	jmp loop_begin
	
start_end:
	mov rcx, rdx

loop_end:	
	cmp rcx, 0
	je end_loop

	mov r9, rcx
	dec r9
	
	mov r8b, [rsi + r9]
	mov [rdi + r9], r8b

	dec rcx
	jmp loop_end

end_loop:
	mov rax, rdi
	ret
