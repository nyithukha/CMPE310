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

    # move value to edx, and add to eax
    mov (%rdi,%rcx,4), %edx
    add %edx, %eax

    inc %rcx
    jmp loop_start
    # eax will hold the total sum to be returned
done:
    ret
.section .note.GNU-stack,"",@progbits
