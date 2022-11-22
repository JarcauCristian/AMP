.data
    vect: .word 1, 2, 3, 5, 9, 21, 27, 300, 104, 100
    len: .word 10

.text
.globl main
main:
    la $a0, vect
    lw $a1, len
    li $t0, 3
    li $t1, 0
    li $t2, 0

loop:
    beq $t1, $a1, exit
    lw $a3, 0($a0)
    div $a3, $t0
    mfhi $t3
    bne $t3, $0, end
    addi $t2, 1

end:
    addi $a0, 4
    addi $t1, 1
    j loop

exit:
    add $a0, $0, $t2
    
    li $v0, 1
    syscall

    li $v0, 10
    syscall
