#	$s1 - current node
#	0($s1) - data
#	4($s1) - link

#	$s2 - current value
#	$s3 - upper limit


			.text
			.globl main

main:
			#	create the 1st node
			li		$v0, 9
			li		$a0, 8
			syscall
            #   store link header->1 in header
            sw      $v0, header
			#   cur node: 1
            move    $s1, $v0
            #   init the 1st node
            li      $t0, 1
            sw      $t0, 0($s1)

			#	init loop
			li		$s2, 2
			li		$s3, 8

loop:		bgtu	$s2, $s3, list_end

			#	create a node
			li		$v0, 9
			li		$a0, 8
			syscall
			#	store link prev->cur in prev
			sw		$v0, 4($s1)
			#	cur node
			move	$s1, $v0
			#	init the new node
			sw		$s2, 0($s1)

			addi	$s2, $s2, 1
			b		loop

list_end:
			sw		$0,  4($s1)
			jr		$ra


			.data
header:		.word	0
