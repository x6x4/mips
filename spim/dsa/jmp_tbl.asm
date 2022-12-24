			.globl main
			.text

main:
			lw		$t0, jtable
			jalr	$t0

			lw		$t0, jtable + 4
			jalr	$t0

			li		$v0, 10
			syscall


			.data
jtable:
			.word	sub1
			.word	sub2

