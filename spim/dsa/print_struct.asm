#		$a0 - struct address, $ra - ret address
#		$s0 - copy of $a0


		.text
		.globl print_struct

print_struct:
		# to keep $s0
		sub		$sp, $sp, 4
		sw		$s0, ($sp)

		# to keep address
		move	$s0, $a0

		# print fields (name: value)
		la      $a0, age
        li      $v0, 4
        syscall
        lw      $a0, 0($s0)
        li      $v0, 1
        syscall
		la		$a0, lf
		li		$v0, 4
		syscall

		# restore $s0
		lw      $s0, ($sp)
		add		$sp, $sp, 4
		jr		$ra


        .data
age:  .asciiz "age:   "
lf:	  .asciiz "\n"
