#	x` = 1/2 ( x + n/x )

#	$f3, $f4 - x` & x
# 	$f8 - tmp
# 	$f10 - accuracy

		.text
		.globl main

main:
		l.s		$f0, n
		li.s	$f1, 1.0
		li.s	$f2, 2.0
#	x = 1.0
		li.s	$f3, 1.0
		li.s	$f10, 1.0e-5
loop:
#		x` = n
		mov.s	$f4, $f0
#		x` = n/x
		div.s	$f4, $f4, $f3
#		x` = x + n/x
		add.s	$f4, $f3, $f4
#		x = (1/2)(x + n/x)
		div.s	$f3, $f4, $f2
#		enough
#		x*x
		mul.s 	$f8, $f3, $f3
#		n - x*x
		sub.s 	$f8, $f0, $f8
#		|n - x*x|
		abs.s		$f8, $f8
		c.lt.s	$f8, $f10
		bc1t	done

		j loop
done:
		mov.s	$f12, $f3
		li		$v0, 2
		syscall

		jr		$ra

		.data
n:		.float	 4.000000e+6
#	3.0 is much interesting
