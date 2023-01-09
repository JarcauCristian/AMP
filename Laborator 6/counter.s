.data 
  TRISE_VADDR: .word 0xBF886100 
  TRISE_VALUE: .word 0xFFFFFFFE 
  PORTE_VADDR: .word 0xBF886110 
  TIMER: .word 0xF
.text 
.globl main 
 
main: 
  #set RE0 as output 
  lw $t0, TRISE_VADDR 
  lw $t1, TRISE_VALUE 
  sw $t1, 0($t0)
  lw $t2, TIMER 
  
  #load port address 
  lw $s0, PORTE_VADDR 
  
  #turn off all the LEDs 
  sw $0, 0($s0) 
 
  LOOP: 
    lw $a0, 0($s0) 
    ori $a0, $a0, 0b0000 
    sw $a0, 0($s0)
    jal COUNTER
    j LOOP

  COUNTER:
    sw $a0, 0($s0)
    addi $a0, $a0, 1
    bne $a0, $t2, COUNTER
    jr $ra