# sum.asm

.section .text
.globl sum_array        # make symbol visible to linker

sum_array:
    # rdi = pointer to int array
    # rsi = number of elements

    xor %rax, %rax
    xor %rcx, %rcx

loop_start:
    cmp %rsi, %rcx
    je done

    mov (%rdi,%rcx,4), %edx
    add %edx, %eax

    inc %rcx
    jmp loop_start
    # Put return value in rax

done:
    ret
.section .note.GNU-stack,"",@progbits
