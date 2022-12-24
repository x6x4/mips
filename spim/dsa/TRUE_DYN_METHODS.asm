			.text
print:
			li		$v0, 4
			addiu	$a0, $a0, 8
			syscall
			jr		$ra


			.text
read:		move	$s1, $a0
			li		$v0, 4
			la		$a0, enter
			syscall

			addiu	$a0, $s1, 8

			li		$a1, 24
			li		$v0, 8
			syscall

			jr		$ra

			.data
enter:		.asciiz		"> "
