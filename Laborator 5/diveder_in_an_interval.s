.data
    n: .word 8
    m: .word 22

.text
.globl main
main:
    lw $a1, n
    lw $a2, m
    li $a3, 3
    li $a0, 1

    slt $s1, $a1, $a2
    beq $s1, $a0, loop

    move $a0, $a1
    move $a1, $a2
    move $a2, $a0

    j loop

loop:
    div $a1, $a3
    mfhi $s1
    beq $s1, $0, print

loop_end:
    addi $a1, 1
    beq $a1, $a2, exit
    j loop

print:
    addu $a0, $0, $a1
    li $v0, 1
    syscall

    li $a0, 32
    li $v0, 11
    syscall

    j loop_end

exit:
    li $v0, 10
    syscall