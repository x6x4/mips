		.text
		.globl  main

#  $8 - holds abs (A)

main:
		lui	  $10, 0x1000   #  base reg
		lw	  $8,  0($10)
		sll   $0,  $0, 0    #  load delay slot (1st mc)

		srl   $9,  $8, 31   #  2nd mc
		beq   $0,  $9, done
		sll   $0,  $0, 0	#  branch delay slot

		subu  $8,  $0, $8
		sw	  $8,  0($10)

done:
		sll   $0,  $0, 0

		.data
A:		.word	1			#  A value
