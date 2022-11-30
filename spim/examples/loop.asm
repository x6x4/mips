#	$8 - counter
#	$9 - true/false flag
#	$10 - sum

init:	ori		$8,  $0,  0
		ori		$10, $0,  0

test:	sltiu   $9,  $8,  10
		beq		$9,  $0,  end_lp
		sll		$0,  $0,  0

		addu    $10, $10, $8
		addiu	$8,  $8,  1
		j		test
		sll		$0,  $0,  0

end_lp:
		sll		$0,  $0,  0
