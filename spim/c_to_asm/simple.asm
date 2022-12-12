#	The milestone: translation from C to Mips asm
#	with non-optimizing compiler

#	C src:
# 1	 main( )
# 2	 {
# 3	     int a;
# 4		 a = mysub( 6 );
# 5		 print( a );
# 6	 }
# 7
# 8	 int mysub( int arg )
# 9	 {
# 10	 int b,c;
# 11
# 12	 b = arg*2;
# 13	 c = b + 7;
# 14
# 15	 return c;
# 16 }

		.text
		.globl main
main:
	# prolog ( lines 1-3 )
	# push caller's ret addr & frame ptr to stack; no S regs to push
	sub		$sp, $sp, 4
	sw		$ra, ($sp)
	sub		$sp, $sp, 4
	sw		$fp, ($sp)
	#	init frame ptr (reserve space for 1 var) & stack ptr
	sub		$fp, $sp, 4
	move	$sp, $fp

    # ( line 4 )
	# subr call
	li		$a0, 6
	jal		mysub
	# regain cntl from the subr (no T regs to restore)
	sw		$v0, ($fp)

	# ( line 5 )
	lw		$a0, ($fp)
	li		$v0, 1
	syscall

	# epilog ( line 6 )
	# reinit sp
	add		$sp, $fp, 4
	# pop frame ptr & caller's ret addr
	lw		$fp, ($sp)
	add		$sp, $sp, 4
    lw      $ra, ($sp)
    add     $sp, $sp, 4

	jr		$ra

		.text
		.globl mysub
#	v0 mysub( a0 arg )
mysub:
	# prolog ( lines 8-10 )
	# push caller's ret addr & frame ptr & s1 to stack
    sub     $sp, $sp, 4
    sw      $ra, ($sp)
    sub     $sp, $sp, 4
    sw      $fp, ($sp)
	sub     $sp, $sp, 4
    sw      $s1, ($sp)
    #   init const frame ptr (reserve space for 2 vars) & stack ptr
    sub     $fp, $sp, 8
    move    $sp, $fp

	# body ( lines 12-13 )
	mul		$s1, $a0, 2
	sw		$s1, ($fp)		# b on top of the stack

	lw		$t0, ($fp)
	add		$t0, $t0, 7
	sw		$t0, 4($fp)		# c in the end of the stack space
							# for local vars
	# epilog ( line 15 )
	lw		$v0, 4($fp)
	# reinit sp
	add		$sp, $fp, 8
	# pop s1 & frame ptr & caller's ret addr
	lw		$s1, ($sp)
	add		$sp, $sp, 4
    lw      $fp, ($sp)
    add     $sp, $sp, 4
    lw      $ra, ($sp)
    add     $sp, $sp, 4

	jr		$ra
