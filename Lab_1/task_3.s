.section .bss
.globl ram
.lcomm ram, 256     # Reserve 256 bytes of RAM (uninitialized memory)

.section .text
.globl fill_ram     # Make function visible to C program

fill_ram:
    # Store 00h into RAM locations 50H - 58H using indirect addressing

    movq $ram, %rax
    addq $0x50, %rax

    xorq %rcx, %rcx

loop_start:
    movb $0x00, (%rax,%rcx,1)

    inc %rcx

    cmp $9, %rcx
    jl loop_start

    ret                     # Return control back to C program

.section .note.GNU-stack,"",@progbits
