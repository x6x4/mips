#	using single-entry jump tables


			.globl main
			.text
main:
			la		$a0, obj1
			lw		$t0, 0($a0)
			jalr	$t0

			la		$a0, obj1
			lw		$t0, 4($a0)
			jalr	$t0

			la      $a0, obj1
            lw      $t0, 0($a0)
            jalr    $t0

            la      $a0, obj2
            lw      $t0, 0($a0)
            jalr    $t0

			li		$v0, 10
			syscall



			.data
obj1:		.word		print
			.word		cancel
			.asciiz		"HW\n"
obj2:		.word		print
			.word		cancel
			.asciiz		"WHO\n"


