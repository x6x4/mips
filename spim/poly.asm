#  shit program
#
#  5, -12, 97
#
#  reg table:
#
#  $10 base reg;
#	   address of x
#  $11 x
#
#  $12 value of poly (also value for poly powers 0 and 1)
#
#  $13 temp (for intermediate products)

		.text
		.globl main

main:
		#  init base reg
		lui  $10, 0x1000
		#  load x
		lw   $11, 0($10)
		#  introduce $12 (during the "load delay slot")
		ori  $12, $0, 97

		#  second term
		ori  $13, $0, 12
		mult $13, $11
		mflo $13
		subu $12, $12, $13

		#  third term
		mult $11, $11
		mflo $11
		ori  $13, $0, 5
		mult $11, $13
		mflo $13

		#  result
		addu $12, $12, $13

		#  store x
		sw   $12, 4($10)

		.data
x:		.word	3
poly:	.word	0

#  end hurrraaayyyyy
