# kop.asm
#
# Convert kops to rubles and kops.

        .text
        .globl  main

main:   li      $v0,4       # print prompt
        la      $a0,prompt
        syscall

        li      $v0,5       # read in kops
        syscall

        li      $t1,100     # 100 kop. per ruble
        divu    $v0,$t1     # lo = rub.; hi = kop.

        mflo    $a0         # move from lo
        li      $v0,1       # print rub
        syscall
        li      $v0,4       # print rubout
        la      $a0,rubout
        syscall

        mfhi    $a0         # move from hi
        li      $v0,1       # print kop
        syscall             #
        li      $v0,4       # print kopout
        la      $a0,kopout
        syscall

        li      $v0,10      # exit
        syscall

        .data
prompt: .asciiz "Enter kops: "
rubout: .asciiz " rub. "
kopout: .asciiz " kop.\n"
