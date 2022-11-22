#counts length of a string

.data
  string: .asciiz "Hello World!"
  string2: .asciiz "Hello"
  string3: .asciiz "Buna"

.text
.globl main
main:
  la $a0, string
  li $t0, 0
  jal loop
  la $a0, string2
  li $t0, 0
  jal loop
  la $a0, string3
  li $t0, 0
  jal loop
  j exit
  
loop:
  lb $t1, 0($a0)
  beqz $t1, end
  addi $a0, 1
  addi $t0, 1
  j loop

end:
  add $a0, $0, $t0
  li $v0, 1
  syscall
  li $a0, 13
  li $v0, 11
  syscall
  jr $ra

exit:
  li $v0, 10
  syscall