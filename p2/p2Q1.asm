.data
mat1: .word 0:64
mat2: .word 0:64
mat3: .word 0:64
space: .asciiz" "
tab: .asciiz"\n"
.macro calc(%dst,%row,%column,%rank)
    multu %row,%rank
    mflo  %dst
    addu  %dst,%dst,%column
    sll   %dst,%dst,2
.end_macro

.text
  li $v0,5
  syscall
  move $t0,$v0  #t0==n
  
  move $s0,$zero  #row counter
  move $s1,$zero  #column counter
    
input:  

  loop1:
    calc($t1,$s0,$s1,$t0)
    li $v0,5
    syscall
    sw $v0,mat1($t1)
    addi $s1,$s1,1
    bne $s1,$t0,loop1
    
    move $s1,$zero
    
    addi $s0,$s0,1
    bne  $s0,$t0,loop1
    
  move $s0,$zero
  move $s1,$zero
      
  loop2:
    calc($t1,$s0,$s1,$t0)
    li $v0,5
    syscall
    sw $v0,mat2($t1)
    addi $s1,$s1,1
    bne $s1,$t0,loop2
    
    move $s1,$zero
    
    addi $s0,$s0,1
    bne  $s0,$t0,loop2
    
  move $s0,$zero  # s0=i
  move $s1,$zero  # s1=j
  move $s2,$zero  # s2=k
  
  loop3:
  calc($t1,$s0,$s2,$t0) #[i][k]
  calc($t2,$s2,$s1,$t0) #[k][j]
  calc($t3,$s0,$s1,$t0) #[i][j]
  
  lw $t4,mat1($t1)
  lw $t5,mat2($t2)
  lw $t6,mat3($t3)
  
  multu $t4,$t5
  mflo $t7
  addu $t6,$t6,$t7
  
  sw $t6,mat3($t3)
  
  addi $s2,$s2,1
  bne $s2,$t0,loop3
  move $s2,$zero
  
  addi $s1,$s1,1
  bne $s1,$t0,loop3
  move $s1,$zero
  
  addi $s0,$s0,1
  bne $s0,$t0,loop3
  
  move $s0,$zero  # s0=i
  move $s1,$zero  # s1=j  
  
  loop4:
    calc($t1,$s0,$s1,$t0)
    
    lw $a0,mat3($t1)
    li $v0,1
    syscall
    
    la $a0,space
    li $v0,4
    syscall
    
    addi $s1,$s1,1
    bne $s1,$t0,loop4
    
    move $s1,$zero
    
    la $a0,tab
    li $v0,4
    syscall
    
    addi $s0,$s0,1
    bne  $s0,$t0,loop4
    
    li $v0,10
    syscall
    

  
  
  
  
    
