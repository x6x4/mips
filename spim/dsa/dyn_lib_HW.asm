            .text
sub1:       li      $v0, 4
            la      $a0, messH
            syscall
            jr      $ra

            .data
messH:      .asciiz "Hello "

            .text
sub2:       li      $v0, 4
            la      $a0, messW
            syscall
            jr      $ra

            .data
messW:      .asciiz "World\n"
