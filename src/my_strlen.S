global strlen
section .text

strlen:
        xor rcx, rcx        ; 'rcx' is the index and 'xor rcx, rcx' is used for set 'rcx' == 0; 'xor' is liked an strcmp

loop:
	cmp BYTE [rdi + rcx], 0 ; 'cmp' is like a compare function in c, 'BYTE' defined that we compare, rdi is the first argument, 
	je end_loop

	inc rcx
	jmp loop

end_loop:
	mov rax, rcx
        ret                 ; return
