        .text
        .globl main

main:

# prolog
push:   sub  $sp, $sp, 4    # not a subu, no trap!
        sw   $ra, ($sp)
# prolog

# body
        la   $a0, help
prstr:  li   $v0, 4
        syscall

        jal     get_lines
# body

# epilog
pop:    lw      $ra, ($sp)
        add     $sp, $sp, 4

        jr      $ra         # main is also a function...
# epilog


        .data
help:
        .ascii  "Enter lines; "
        .asciiz "q to quit"

# Actually, OS in spim is an exception handler and primitive kernel.
# You can see this in a "kernel" code section.
