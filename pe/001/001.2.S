	.global	main

	.text
main:
	mov	$999, %rax	# i = 999
	xor	%rbx, %rbx	# sum = 0
	
	mov	$3, %rcx	# dividends = 3, 5
	mov	$5, %r8

iter:
	push	%rax		# save divisor (i)
	xor	%rdx, %rdx	# set rdx to 0
	div	%rcx		# i/3 => rax remainder rdx
	pop	%rax		# restore divisor (i)
	test	%rdx, %rdx	# check if remainder == 0
	jz	addts		# if divides evenly, add to sum

	push	%rax
	xor	%rdx, %rdx
	div	%r8
	pop	%rax
	test	%rdx, %rdx
	jz	addts

deci:				# decrement i
	dec	%rax
	jnz	iter	

	mov	$fmt, %rdi	# printf("%d\n", rbx)
	mov	%rbx, %rsi
	xor	%rax, %rax
	call	printf

	xor	%rax, %rax
	ret

addts:				# add to sum
	add	%rax, %rbx
	jmp	deci
	
fmt:	.asciz	"%d\n"
