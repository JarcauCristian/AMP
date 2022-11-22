.data
    m: .word 5
    n: .word 10

.text
main:
    lw $t0, m
    lw $t1, n
    add $a0, $t0, $t1

    li $v0, 1
    syscall