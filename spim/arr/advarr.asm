#		NO DELAY SLOTS
#		$v0 - temp
#		$v1 - sum
#		$t1 - idx
#		$t2 - loop counter

		.text
		.globl main

main:
		# init
		li	 $v1, 0
		li   $t1, 0
		li   $t2, 0
for:
		beq  $t2, 5, endfor
		lw	 $v0, arr ($t1)		# just another form of offset,
		addu $v1, $v1, $v0		# nothing more :/

		addi $t1, $t1, 4
        addi $t2, $t2, 1
		b	 for

endfor:
		li	 $v0, 10
		syscall

		.data
arr:    .word  1, 2, 3, -5, 1
