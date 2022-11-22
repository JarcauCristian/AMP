.data
    numar: .word 12
.text
.globl main
main:
    lw $t0, numar
    li $t1, 2
    li $t2, 1
    li $t3, 0

    addu $a0, $0, $t3
    li $v0, 1
    syscall

    li $a0, 32
    li $v0, 11
    syscall

    addu $a0, $0, $t2
    li $v0, 1
    syscall

    li $a0, 32
    li $v0, 11
    syscall

loop:
    addi $t1, 1
    add $t4, $t2, $t3
    jal print

    move $t3, $t2
    move $t2, $t4
    beq $t0, $t1, exit

    j loop

print:
    addu $a0, $0, $t4

    li $v0, 1
    syscall

    li $a0, 32
    li $v0, 11
    syscall

    jr $ra

exit:
    li $v0, 10
    syscall

