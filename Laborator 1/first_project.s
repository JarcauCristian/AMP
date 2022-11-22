.data
    sir1: .ascii "Hello\n"
    sir2: .asciiz "World!"

.text
.globl main

main:
    li $v0, 4
    la $a0, sir1

    li $v0, 4
    la $a0, sir2
    syscall

    li $v0, 10
    syscall