#	 a0, a1 - args
#    v0 - returned value

		.text
		.globl readint

readint:
		la    $a0, enter
		li	  $v0, 4
		syscall

		li    $v0, 5
		syscall

		jr    $ra
		nop

		.data
enter:
		.asciiz "Enter int: "
