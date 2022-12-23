#	hard-coded ll	(NOT dynamic)

#	$s0 - current node pointer

			.text
			.globl main

main:
			la		$s0, head
# dyn. v.	lw		$s0, header

loop:		beqz	$s0, is_null

			lw		$a0, 0($s0)
			li		$v0, 1
			syscall

			la		$a0, sep
			li		$v0, 4
			syscall

			lw		$s0, 4($s0)
			b		loop

is_null:	la		$a0, lf
			li		$v0, 4
			syscall

			la		$a0, endmess
			li		$v0, 4
			syscall

			li		$v0, 10
			syscall


			.data
head:
elm01:		.word	1
			.word	elm02
elm02:		.word	2
			.word	elm03
elm03:		.word	3
			.word	elm04
elm04:  	.word   5
        	.word   elm05
elm05:  	.word   7
        	.word   0

sep:		.asciiz	" "
lf:			.asciiz "\n"
endmess:	.asciiz "end\n"
