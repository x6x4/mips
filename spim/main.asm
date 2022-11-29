#	$s0, $s1, $s2 - ints
#   computing sum of 3 ints in $s3

#	syscalls are also functions
#	waiting for args in $a0-$a1
#	and returning values in $v0-$v1

		.text
		.globl main

main:
		jal	    readint
		nop
		move    $s0, $v0

		jal     readint
        nop
        move    $s1, $v0

        jal     readint
        nop
        move    $s2, $v0

		addu $s0, $s0, $s1
		addu $s3, $s0, $s2 # ????
# author el govno

		li    $v0, 4
		la    $a0, output
		syscall

		move  $a0, $s3
		li    $v0, 1
		syscall

		li    $v0, 10
		syscall

		.data
output:
		.asciiz	"Sum: "
