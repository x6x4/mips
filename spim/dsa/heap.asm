		.text

		.globl main
main:
#		alloc 4 bytes

		li 		$v0, 9
		li		$a0, 4
		syscall

#		keep addr

		move	$s0, $v0

#		check all is working

		li		$t0, 77
		sw		$t0, 0($s0)
		lw		$a0, 0($s0)
		li		$v0, 1
		syscall

# 		exit

		li		$v0, 10
		syscall
