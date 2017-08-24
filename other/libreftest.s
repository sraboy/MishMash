	.file	"libreftest.c"
	.text
	.globl	doupper
	.type	doupper, @function
doupper:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -52(%rbp)
	movl	%esi, -56(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	-52(%rbp), %eax
	movl	%eax, -40(%rbp)
	movabsq	$5932458007759515507, %rax
	movq	%rax, -32(%rbp)
	movl	$4673097, -24(%rbp)
	movl	-52(%rbp), %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	pxor	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	movss	%xmm0, -36(%rbp)
	jmp	.L2
.L3:
	movl	-56(%rbp), %eax
	cltq
	movzbl	-32(%rbp,%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	toupper
	movl	%eax, %edi
	call	putchar
	movl	-52(%rbp), %eax
	addl	$4, %eax
	pxor	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	movss	-36(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -36(%rbp)
	addl	$1, -40(%rbp)
.L2:
	movl	-40(%rbp), %edx
	movl	-52(%rbp), %eax
	addl	%edx, %eax
	cltq
	movzbl	-32(%rbp,%rax), %eax
	testb	%al, %al
	jne	.L3
	movl	$10, %edi
	call	putchar
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L4
	call	__stack_chk_fail
.L4:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	doupper, .-doupper
	.globl	dolower
	.type	dolower, @function
dolower:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -52(%rbp)
	movl	%esi, -56(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	-52(%rbp), %eax
	movl	%eax, -40(%rbp)
	movabsq	$5932458007759515507, %rax
	movq	%rax, -32(%rbp)
	movabsq	$8315174775723347529, %rax
	movq	%rax, -24(%rbp)
	movl	$1380272160, -16(%rbp)
	movw	$69, -12(%rbp)
	pxor	%xmm0, %xmm0
	cvtsi2ss	-52(%rbp), %xmm0
	movss	%xmm0, -36(%rbp)
	jmp	.L6
.L7:
	movl	-56(%rbp), %eax
	cltq
	movzbl	-32(%rbp,%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	tolower
	movl	%eax, %edi
	call	putchar
	movl	-52(%rbp), %edx
	movl	-40(%rbp), %eax
	addl	%edx, %eax
	pxor	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	movss	-36(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -36(%rbp)
	addl	$1, -40(%rbp)
.L6:
	movl	-40(%rbp), %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	subl	-52(%rbp), %eax
	cltq
	movzbl	-32(%rbp,%rax), %eax
	testb	%al, %al
	jne	.L7
	movl	$10, %edi
	call	putchar
	movss	-36(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L9
	call	__stack_chk_fail
.L9:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	dolower, .-dolower
	.globl	calldoupper
	.type	calldoupper, @function
calldoupper:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -52(%rbp)
	movl	%esi, %eax
	movss	%xmm0, -60(%rbp)
	movb	%al, -56(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movabsq	$7453010373645639777, %rax
	movq	%rax, -32(%rbp)
	movb	$0, -24(%rbp)
	movl	-52(%rbp), %eax
	movb	%al, -28(%rbp)
	pxor	%xmm0, %xmm0
	cvtsi2ss	-52(%rbp), %xmm0
	addss	-60(%rbp), %xmm0
	movss	%xmm0, -36(%rbp)
	jmp	.L11
.L12:
	movss	-36(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	movl	-52(%rbp), %edx
	movl	%edx, %esi
	movl	%eax, %edi
	call	doupper
	addl	$1, -52(%rbp)
.L11:
	pxor	%xmm0, %xmm0
	cvtsi2ss	-52(%rbp), %xmm0
	ucomiss	-36(%rbp), %xmm0
	ja	.L12
	movzbl	-56(%rbp), %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L14
	call	__stack_chk_fail
.L14:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	calldoupper, .-calldoupper
	.globl	calldolower
	.type	calldolower, @function
calldolower:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	movl	$4, -8(%rbp)
	jmp	.L16
.L17:
	movl	-4(%rbp), %edx
	movl	-8(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	dolower
	subl	%eax, -8(%rbp)
	addl	$1, -8(%rbp)
.L16:
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jl	.L17
	movl	-8(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	calldolower, .-calldolower
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
