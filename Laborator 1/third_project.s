.text
main:
    li $t0, 14
    addi $a0, $t0, 10

    li $v0, 1
    syscall

    li $v0, 10
    syscall