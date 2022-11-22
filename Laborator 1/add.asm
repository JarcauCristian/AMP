.globl main
.text
main:
	li $t2, 25
	lw $t3, value
	add $t1, $t2, $t3
	li $v0 10
	syscall

value: .half 2