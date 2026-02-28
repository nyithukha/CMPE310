.section .text
.globl hamming_distance     # Make function visible to C program

hamming_distance:
    xorq %rax, %rax         # Set rax to 0 for total

loop_start:
    movzbq (%rdi), %rbx     # load byte from s1, zero extend to 64bit
    xor %r8, %r8            # use r8 as flag
    test %bl, %bl           # test last byte for null
    jz s1_null              # jump if 0
    jmp s1_ok
    s1_null:
    mov $1, %r8             # set flag as 1

    s1_ok:
    movzbq (%rsi), %rcx     # load byte from s2, do the same as s1
    xor %r9, %r9
    test %cl, %cl
    jz s2_null              # do the same as in s1  
    jmp s2_ok
    s2_null:
    mov $1, %r9
    
    s2_ok:
    test %r8, %r8           # AND, if 1, go to done
    jnz done
    test %r9, %r9
    jnz done

    xor %rbx, %rcx          # different bits will be set 1 in rcx
    popcnt %rcx, %rcx       # count number of 1's
    addq %rcx, %rax         # add 1's to total

    inc %rdi                # move to next char
    inc %rsi
    jmp loop_start

done:
    ret                         # Return control back to C program

.section .note.GNU-stack,"",@progbits
