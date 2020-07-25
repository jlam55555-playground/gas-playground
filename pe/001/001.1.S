	.global	main

	.text
main:
	xor	%rbx, %rbx	# sum = 0

	xor	%rax, %rax	# i = 0
sum3:
	add	%rax, %rbx	# sum += i
	add	$3, %rax	# i += 3
	cmp	max, %rax	# if(rax < max)
	jl	sum3		# goto sum3

	xor	%rax, %rax
sum5:
	add	%rax, %rbx
	add	$5, %rax
	cmp	max, %rax
	jl	sum5

	xor	%rax, %rax
sub15:
	sub	%rax, %rbx
	add	$15, %rax
	cmp	max, %rax
	jl	sub15

	mov	$fmt, %rdi	# printf(fmt, sum)
	mov	%rbx, %rsi
	xor	%rax, %rax	# clear this (for printf to work properly)
	call	printf
	
	xor	%rax, %rax	# return(0)
	ret

fmt:	.asciz	"%d\n"
max:	.quad	1000
