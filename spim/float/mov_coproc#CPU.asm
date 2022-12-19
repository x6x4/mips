#	it could be the implementation of Horner's Method
#	( a * x + b ) * x + c
#	but i'm too tired

			.text
			.globl main

main:
			la		$a0, prompt
			li		$v0, 4
			syscall

			li		$v0, 6
			syscall
# read val is in $f0

			li		$t0, 1
# to coproc
			mtc1	$t0, $f0

			li.s	$f1, 1.0
# to CPU
			mfc1	$t1, $f1

			li		$v0, 10
			syscall

			.data
prompt:		.asciiz "Gimme float: "
#	here (or upper) could be values of a, b, c...
