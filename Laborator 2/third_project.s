.data
    n: .word 0x80000002
    m: .word 0x80000003
.text
.globl main
main:
    lw $s0, n
    lw $s1, m
    add $s2, $s0, $s1