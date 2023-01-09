.data 
  TRISE_VADDR: .word 0xBF886100 
  TRISE_VALUE: .word 0xFFFFFFFE 
  PORTE_VADDR: .word 0xBF886110 
  TIMER: .word 0xFFFFFFFFFFFFFFFFFFFFFF
.text 
.globl main 
 
main: 
  #set RE0 as output 
  lw $t0, TRISE_VADDR 
  lw $t1, TRISE_VALUE 
  sw $t1, 0($t0) 
  
  #load port address 
  lw $s0, PORTE_VADDR 
  
  #turn off all the LEDs 
  sw $0, 0($s0) 
 
  LOOP: 
    lw $a0, 0($s0) 
    ori $a0, $a0, 0b1111 
    sw $a0, 0($s0)
	jal DELAY
	lw $a0, 0($s0)
	li $a0, 240
	sw $a0, 0($s0)
	jal DELAY
  j LOOP

  DELAY:
	lw $s1, TIMER
	li $s2, 1
	DELAYLOOP:
		sub $s1, $s1, $s2
		bne $s1, $0, DELAYLOOP
		jr $ra