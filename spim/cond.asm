#	avtoru vse len
#	WITHOUT delay slots!!!!!!!!!!!!
#	$t0 - val
#	$t1 - odd sum
#	$t2 - even sum
#	$t8 - parity sign

		.text
		.globl main

main:	 lw		$t0, val
		 andi	$t8, $t0, 1

if_even: bnez	$t8, else

		 addu	$t2, $t2, $t0
		 b		endif

else:	 addu	$t1, $t1, $t0

endif:

		.data
val:	.word	5
