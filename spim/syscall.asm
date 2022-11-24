		.text
		.globl	main

main:
		li		$v0, 1
		lw		$a0, int
		syscall

		li		$v0, 10
		syscall

		.data
int:	.word       ?
