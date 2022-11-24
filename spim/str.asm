#	string length
#	$8 - accumulator
#	$9 - ptr to the char
#	$10 - char (in low order byte)

        .text
        .globl main

main:   #	init
		ori $8, $0, 0
		lui $9, 0x1000

loop:	#	get the char
		lbu $10, 0($9)
		sll $0, $0, 0

		beq $10, $0, endloop
		sll $0, $0, 0

		addiu $8, $8, 1
		addiu $9, $9, 1
jmp:
		j	loop
		sll $0, $0, 0

endloop:
		sll $0, $0, 0

        .data
str:    .asciiz "Back in control"
