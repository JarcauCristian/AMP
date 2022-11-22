.data
    arr: .word 0:2
.text
.globl main
main:
    li $t1, 0
loop:
    addi $t1, 1
    beq $t1, 2 exit
    li $v0, 1
    lw $t0, arr($t0)
    syscall
    j loop
exit:
    li $v0, 10
    syscall
    jr $ra