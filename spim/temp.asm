#	correct t range:  30 <= t <= 55
#	regs:
#	$2 - t
#	$3 - flag
#	$8 - buffer flag

		.text

		.globl main

main:   #  set t (from -2^15 to 2^15 - 1)
		addiu   $2, $0, -32768
		#  set flag
		ori   $3, $0, 1

		#  test upper bound
		sltiu $8, $2, 56
		beq	  $8, $0, out
		sll	  $0, $0, 0    		#  branch delay

		#  test lower bound
		sltiu $8, $2, 30
		beq   $8, $0, cont
		sll   $0, $0, 0     		#  branch delay
out:
		#  clear flag
		ori  $3, $0, 0

cont:
		sll  $0, $0, 0
