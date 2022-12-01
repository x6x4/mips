# This is a library! My first creation in MIPS.


# get_lines (prompt)
		.text
		.globl get_lines

get_lines:
		sub		$sp, $sp, 4
		sw		$ra, ($sp)

nextline:
		la      $a0, buf
		li      $a1, 132
		jal		get_line

		la 		$a0, buf
		jal		if_quit
		beqz	$v0, endloop

		la		$a0, buf
		la      $a1, 132
		jal		ucase_line

		la		$a0, magic
		li		$v0, 4
		syscall

		b		nextline

endloop:
		lw		$ra, ($sp)
		add		$sp, $sp, 4
		jr		$ra

		 .data
magic:   .ascii ":"
buf:	 .space 132


# get_line (buf, buflen)
		.text
		.globl get_line

get_line:
		move	$t0, $a0
		la		$a0, prompt
		li		$v0, 4
		syscall

		move	$a0, $t0
		li		$v0, 8
		syscall

		jr		$ra

		.data
prompt:
		.asciiz ">"


# if_quit (buf)
        .text
        .globl if_quit

if_quit:
        li      $v0, 1

        lbu     $t0, 0($a0)
        li      $t1, 'Q'
        bne     $t0, $t1, quit

        lbu     $t0, 1($a0)
        li      $t1, '\n'
        bne     $t0, $t1, quit

        li      $v0, 0

quit:   jr      $ra


# ucase_line (buf, buflen)
		.text
		.globl ucase_line

ucase_line:
		sub		$sp, $sp, 4
		sw		$ra, ($sp)
		sub     $sp, $sp, 4
        sw      $s0, ($sp)

		move	$s0, $a0

loop:
		lbu		$a0, ($s0)
		beqz	$a0, endl

		jal		ucase_char
		sb		$v0, ($s0)

		addu	$s0, $s0, 1
		b		loop

endl:
		lw		$s0, ($sp)
		add		$sp, $sp, 4
		lw		$ra, ($sp)
		add		$sp, $sp, 4

		jr		$ra


# ucase_char (char)
		.text
		.globl ucase_char

ucase_char:
		move	$v0, $a0

		li		$t0, 'a'
		blt 	$a0, $t0, end
		li		$t0, 'z'
		blt		$t0, $a0, end

		sub		$v0, $a0, 32

end:	jr		$ra

