.data
Numbers:
	.long 1
	.long 15
	.long 4
	.long 2
	.long 7
	.long 9
	.long 23
	.long 7
	.long 3
	.long 11
Array_length:
	.long 10

	.text
	.globl main
	.type main, @function
main:
	pushq	%rbp
	movq	%rsp, %rbp

	leaq	Numbers(%rip), %rsi         ; rsi = pointer to start of array
	movl	Array_length(%rip), %ecx    ; ecx = 10 (loop counter)
	movl	(%rsi), %eax                ; eax = first element (initial max)
	addq	$4, %rsi                    ; advance pointer past first element
	subl	$1, %ecx                    ; counter--

	jmp	.Lcheck                         ; jump to condition first (while loop style)

.Lbody:
	movl	(%rsi), %edx                ; edx = current element
	cmpl	%edx, %eax                  ; compare max to current
	jge	.Lskip                          ; if max >= current, skip update
	movl	%edx, %eax                  ; else, update max

.Lskip:
	addq	$4, %rsi                    ; advance pointer to next element
	subl	$1, %ecx                    ; counter--

.Lcheck:
	cmpl	$0, %ecx                    ; while counter > 0
	jg	.Lbody                          ; jump to body if true
										; done means max is in eax
	popq	%rbp
	ret
