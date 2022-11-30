#	add two ints

		.data
val0:	.word	0
val1:   .word   1
val2:   .word   2
val3:   .word   3
val4:   .word   4
val5:   .word   5

		.text
		.globl	main

main:
		la		$t0, val2
		lw		$t1, 0($t0)
		lw		$t2, 4($t0)
		sll		$0,  $0,  0
		addu	$t1, $t1, $t2
