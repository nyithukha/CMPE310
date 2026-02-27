.section .bss

.section .text
.globl hamming_distance     # Make function visible to C program

hamming_distance:
    xorq %rax, %rax         # Set rax to 0

loop_start:
    movb (%rdi), %al
    cmpb $0, %al
    je done

    movb(%rsi), %bl
    cmpb $0, %bl
    je done

    xor %bl, %al        # Different bits will be 1 in %al
    mov %al, %cl        # Store the XOR'ed bits in %cl
    xor %dl, %dl        # Initialize %dl to act as bit-counter

count_bits_loop:
    test %cl, %cl       # Check if cl is 0
    jz bits_done        # Jump to bits_done if cl is 0

    test $1, %cl        # AND between 1 and cl, will be 1 if LSBs are both 1
    jz next_bit         # Jump to compare next bit if both 0
    inc %dl             # Increase dl by 1 if LSB equal

next_bit:
    shr %cl, 1
    jmp count_bits_loop

bits_done:
    addq %dl, %rax

    inc %rdi
    inc %rsi
    jmp loop_start

done:
    ret                         # Return control back to C program

.section .note.GNU-stack,"",@progbits
