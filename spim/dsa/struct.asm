		.text
		.globl main

main:
		# 1st struct
		li		$v0, 9
		li		$a0, 12
		syscall
		move	$s1, $v0

		# fields: age, pay, class
		li		$t0, 34
		sw		$t0, 0($s1)

		lw		$t0, pay
		sw		$t0, 4($s1)

		li		$t0, 12
		sw		$t0, 8($s1)

		move	$a0, $s1
		jal		print_struct

		# 2nd struct
		li		$v0, 9
		li		$a0, 12
		syscall
		move	$s2, $v0

		# copy fields from 1st struct to 2nd struct
		lw		$t0, 0($s1)
		sw		$t0, 0($s2)

		lw      $t0, 4($s1)
        sw      $t0, 4($s2)

		lw      $t0, 8($s1)
        sw      $t0, 8($s2)

		move	$a0, $s2
		jal print_struct

		li		$v0, 10
		syscall

		.data
pay:	.word	24000
age:	.asciiz "age: "
