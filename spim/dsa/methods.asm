#	print
            .text
print:
            li      $v0, 4
            addu    $a0, $a0, 8
            syscall
            jr      $ra


#	cancel
#   $t0 - char replaced
#   $t1 - cntl char
#   $t2 - char replacer

			.text
cancel:
            addiu   $t0, $a0, 8

            li      $t2, 'x'
            lb      $t1, 0($t0)

lp:         beqz    $t1, str_end
            sb      $t2, 0($t0)

            addiu   $t0, $t0, 1
            lb      $t1, 0($t0)
            b       lp

str_end:
            jr      $ra
