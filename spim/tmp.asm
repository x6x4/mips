# ori	$8, $0, 9
# sll $8, $8, 8
# addiu    $3,$0,-1
# sltiu     $5,$3,17

		.text
		.globl main

main:
		li	  $t0,	43
		li    $t1,	-96
		li	  $t7,  -16772555
		addu  $t1,	$t1,  $t0
		addu  $t0,  $t0,  $t7
