.section .bss
.globl ram
.lcomm ram, 256     # Reserve 256 bytes of RAM (uninitialized memory)

.section .text
.globl fill_ram     # Make function visible to C program

fill_ram:
    movq $ram, %rax             # Store address of ram in rdi
    addq $0x46, %rax            # Ram address now 0x46

    mov $0, %rdi                # Starting value of sum
    xorq %rcx, %rcx             # Set loop counter 0

loop_start:
    add %rcx, %rdi              # Add Value of rcx counter to rdi
    movq %rdi, (%rax,%rcx,1)    # Store value at rax with appropriate offset
    inc %rcx                    # Add 1 to value of rcx

    cmp $11, %rcx               # stop when counter is 11
    jl loop_start

    ret                         # Return control back to C program

.section .note.GNU-stack,"",@progbits
