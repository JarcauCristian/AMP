.data
    n: .word 5
    m: .word 6
.text
.globl main
main:
    lw $s0, n
    lw $s1, m
    mult $s0, $s1
    mfhi $s2
    mflo $s3
    mul $s4, $s0, $s1
    jr $ra
