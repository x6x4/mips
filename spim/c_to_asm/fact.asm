# main ( )
# {
#	int a;
#	write ("enter an int");
#	read ( a );
#	write ("factorial is:");
#	print ( fact ( a ) );
# }

# int fact ( int n )
# {
##	if ( n <= 1 )
#		return 1;
##	else
#		return n*fact (n-1);
# }


		.text
		.globl main
main:
	# prolog
	sub  $sp, $sp, 4
	sw	 $ra, ($sp)
	sub  $sp, $sp, 4
	sw   $fp, ($sp)

	# 0 lcl var & init fptr (old sptr) & sptr
	sub  $fp, $sp, 0
	move $sp, $fp

	la   $a0, prompt
	li	 $v0, 4
	syscall

	li	 $v0, 5
	syscall
	move $a0, $v0
	jal  fact
#	sw	 $v0, ($fp)		# sudden lcl var :/
	move $t0, $v0

    la   $a0, res
    li   $v0, 4
	syscall
	move $a0, $t0
	li	 $v0, 1
	syscall

	# epilog
	# restore sp
	add  $sp, $fp, 0

	lw	 $fp, ($sp)
	add	 $sp, $sp, 4
    lw   $ra, ($sp)
    add  $sp, $sp, 4

	jr	 $ra

		.data
prompt:	.asciiz "enter an int: "
res:	.asciiz  "factorial is: "


		.text
		.globl fact
# v0 (a0)
fact:
    # prolog
    sub  $sp, $sp, 4
    sw   $ra, ($sp)
    sub  $sp, $sp, 4
    sw   $fp, ($sp)
	sub	 $sp, $sp, 4
	sw	 $s0, ($sp)

    # 0 lcl var & init fptr (old sptr) & sptr
    sub  $fp, $sp, 0
    move $sp, $fp

	blt  $a0, 1, one
	move $s0, $a0
	sub  $a0, $a0, 1
	jal	 fact
	mul  $v0, $s0, $v0
	b    end

one:
	li	 $v0, 1

end:
	# restore sptr
	add $sp, $fp, 0

    lw   $s0, ($sp)
    add  $sp, $sp, 4
    lw   $fp, ($sp)
    add  $sp, $sp, 4
    lw   $ra, ($sp)
	add	 $sp, $sp, 4

	jr	 $ra

