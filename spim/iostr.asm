		.text
		.globl main

main:
		li		$v0, 4		 # print string
		la		$a0, prompt  # syscall arg1
		syscall

		li		$v0, 8		 # read string
		la		$a0, namebuf # syscall arg1
		li		$v1, 0		 # syscall arg2
		syscall

		li      $v0, 4       # print string
        la      $a0, greet   # syscall arg1
        syscall

		li      $v0, 4       # print string
        la      $a0, msg  # syscall arg1
        syscall

		li		$v0, 10
		syscall

		.data
prompt:  .asciiz  "Hi luser whats yo name\n"
greet:	 .ascii	  "Dear "
namebuf: .space	  8
# wtf to do with comma??? how is this shit working?????
msg:	 .ascii	  "Fuck you"
		 .asciiz  "\nVery much"
