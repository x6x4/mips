#	single precision: 24 BInary digiTS
#	~ 7-8 dec digits (10^7 - 10^8)
 		.text
		.globl main

main:
		l.s		$f0, valA
#	or	lw		$t0, valA -
#	that's no arithmetic, just bit patterns
		l.s		$f1, valB
		s.s		$f0, valB
		s.s		$f1, valA

#	print float
		l.s		$f12, valB
		li		$v0, 2
		syscall

		li		$v0, 10
		syscall

		.data
valA:	.float 8.32
valB:	.float -0.6234e4

#	<biased exp> 0111 1111 + e
#	cmds: .s - single, .d - double
#	mov.s, mtc1, mfc1
