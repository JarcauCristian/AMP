.data
    a0: .word 20
    a1: .word 10
    a2: .space 4

.text
.globl main
main:
    lw $s0, a0
    lw $s1, a1
    beq $s0, $s1, THENIF
    slt $t0, $s0, $s1

    beq $t0, $0, THENIF
    j ENDIF
THENIF:
    add $s2, $0, $s1
ENDIF:
    addi $s2, $s2, 1
    sw $s2, a2
    jr $ra