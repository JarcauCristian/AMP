.data
	array: .word 2, -3, 1, 4, -9, 5
	len: .word 6
	str: .asciiz "The maxim in the vector is: "
	str2: .asciiz "The minimum in the vector is: "
	inp: .asciiz "0 for Min in array : 1 for Max in array : 2 for Exit"
	exitprog: .asciiz "Exiting the program..."

.text
.globl main
main:
	li $t5, 2
mainloop:
	li $t3, 1
	la $a0, inp
	li $v0, 4
	syscall

	li $a0, 13
	li $v0, 11
	syscall

	li $v0, 5
	syscall
	
	addu $t4, $0, $v0
	beq $t4, $t5, mainexit
	lw $a0, len
	lw $a1, array($zero)
	li $t0, 0
	li $t1, 0
	beq $t4, $0, loopmin
	beq $t4, $t3, loop

loop:
	beq $t1, $a0, exit
	lw $s0, array($t0)
	addi $t0, 4
	addi $t1, 1
	slt $t2, $a1, $s0
	beq $t2, $t3, switch
	j loop

loopmin:
	beq $t1, $a0, exit
	lw $s0, array($t0)
	addi $t0, 4
	addi $t1, 1
	slt $t2, $a1, $s0
	beq $t2, $0, switchmin
	j loopmin

switch:
	addi $a1, $s0, 0
	j loop

switchmin:
	addi $a1, $s0, 0
	j loopmin

exit:
	beqz $t4, changetxt
	la $a0, str
	li $v0, 4
	syscall
 	move $a0, $a1	
 	li $v0, 1
	syscall
	li $a0, 13
	li $v0, 11
	syscall
	j mainloop

changetxt:
	la $a0, str2
	li $v0, 4
	syscall
 	move $a0, $a1	
 	li $v0, 1
	syscall
	li $a0, 13
	li $v0, 11
	syscall
	j mainloop

mainexit:
	la $a0, exitprog
	li $v0, 4
	syscall
	li $v0, 10
	syscall
