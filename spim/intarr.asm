#	arr sum, pos sum, neg sum
#	$8  - arr size
#	$9  - arr entry ptr
#	$10 - arr entry
#	$11 - sum
#	$12 - gez sum
#	$13 - ltz sum

		.data
sz: 	.word	4
arr:	.word	1, 2, -2, -1


		.text
main:	ori		$8,  $0,  0
		ori		$11, $0,  0
		ori     $12, $0,  0
		ori     $13, $0,  0
		lui		$9,  0x1000

		lw		$8,  0 ($9)
		sll		$0,	 $0,  0
		addiu	$9,  $9,  4
#	fetch and add up
loop:
		beq		$8,  $0,  endloop
		sll		$0,  $0,  0
		lw		$10, 0 ($9)
		sll		$0,  $0,  0
		addu	$11, $11, $10
		bgez	$10, addgez
		sll		$0,  $0,  0
		j		cont
		sll		$0,  $0,  0
addgez:
		addu	$12, $12, $10

cont:
        addiu   $9,  $9,  4
        addiu   $8,  $8, -1
        j       loop
        sll     $0,  $0,  0


endloop:
		subu	$13, $11, $12
		sll		$0,  $0,  0
