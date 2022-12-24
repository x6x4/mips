#	begin
#		obj1 = new object( );
#		obj1.read( );
#		obj1.print( );
#	end;


			.globl main
			.text

main:
			li		$v0, 9
			li		$a0, 32
			syscall
			sw		$v0, obj1

#	obj constructor
			la		$t0, read
			sw		$t0, 0($v0)
			la		$t0, print
			sw		$t0, 4($v0)

#	methods invocation
			lw		$a0, obj1
			lw		$t0, 0($a0)
			jalr	$t0

			lw		$a0, obj1
			lw		$t0, 4($a0)
			jalr	$t0

#	quit
			li		$v0, 10
			syscall


			.data
obj1:		.word	0
obj2:		.word	0
