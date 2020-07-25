	.global	main

	.text
sumtm:				# arithmetic SUM up To Max: int sum(int n)
	mov	max, %rax	# i = floor(max/n) (result in rax)
	xor	%rdx, %rdx
	div	%rdi
	mov	%rax, %rcx	# j = i+1
	inc	%rcx
	imul	%rcx, %rax	# j *= i (= i*(i+1))
	shr	$1, %rax	# j >>= 1 (= i*(i+1)/2)
	imul	%rdi, %rax	# j *= n (= n*i*(i+1)/2)
	ret			# return j

main:
	xor	%rsi, %rsi	# sum = 0
	mov	$3, %rdi
	call	sumtm
	add	%rax, %rsi	# sum += sumtm(3)
	mov	$5, %rdi
	call	sumtm
	add	%rax, %rsi	# sum += sumtm(5)
	mov	$15, %rdi
	call	sumtm
	sub	%rax, %rsi	# sum -= sumtm(15)

	mov	$fmt, %rdi	# printf("%d\n", sum)
	xor	%rax, %rax	# needed for printf to work correctly
	call	printf
	
	xor	%rax, %rax	# return 0
	ret

fmt:	.asciz	"%d\n"
max:	.quad	999
