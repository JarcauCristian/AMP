.text
.globl main
main:
    li $s0, 22
    lui $t0, 100
    sw $s0, 0($t0)