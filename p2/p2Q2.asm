.data
space: .word 0:40

.text

  li $v0,5
  syscall
  move $t0,$v0
  
  move $s0,$zero  #s0=i
  move $s1,$zero
  
input:
 loop1:
  li $v0,12
  syscall
  move $t1,$v0
  
  sll $s1,$s0,2
  sw $t1,space($s1)
  addi $s0,$s0,1
  bne $s0,$t0,loop1
  
  move $s0,$zero#s0=i
  move $s1,$zero
  sub $s1,$t0,$s0
judge:
 loop2:
 
 sll $s2,$s0,2
 sll $s3,$s1,2
 subi $s3,$s3,4
 
 lw $t1,space($s2)
 lw $t2,space($s3)
 
 bne $t1,$t2,is_0
 addi $s0,$s0,1
 sub $s1,$t0,$s0
 sub $s7,$s0,$s1
 bltz $s7,loop2
 
 
  
  
  
  
 is_1:
 li $a0,1
 li $v0,1
 syscall
   li $v0,10
  syscall
 
 is_0:
  li $a0,0
  li $v0,1
  syscall
  
  li $v0,10
  syscall
  