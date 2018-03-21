	global strcasecmp
	section .text

strcasecmp:
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

carry_on_loop:	
	inc rcx
	jmp loop

str_end:
	mov r8b, [rsi + rcx]
	cmp BYTE [rdi + rcx], r8b
	je end_loop
	
diff_occurs:
	xor r9b, r9b
	mov r10b, [rdi + rcx]
	
	cmp r10b, 65
	jb transform_second
	cmp r10b, 90
	ja transform_second
	add r10b, 32

transform_second:
	cmp r8b, 65
	jb cmp_transform
	cmp r8b, 90
	ja cmp_transform
	add r8b, 32

cmp_transform:
	cmp r10b, r8b
	je carry_on_loop
	
make_result:	
	add r9b, r10b
	sub r9b, r8b
	movsx rax, r9b
	jmp end_loop

end_loop:
	ret
