#	С ДНЁМ ДНЯ
		.text
		.globl	main

main:
		li		$v0, 1
		lw		$a0, int
		nop
		syscall

		li		$v0, 10
		syscall

		.data
int:	.word       8
