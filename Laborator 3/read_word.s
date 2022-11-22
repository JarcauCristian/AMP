.text
.globl main
main:
    li $v0, 5
    syscall
    addu $t0, $0, $v0
