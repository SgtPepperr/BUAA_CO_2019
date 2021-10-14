.data
mat1: .word 0:121
mat2: .word 0:121
mat3: .word 0:121
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
  move $t0,$v0   #t0=m1
 li $v0,5
  syscall
  move $t1,$v0   #t1=n1
   li $v0,5
  syscall
  move $t2,$v0  #t2=m2
   li $v0,5
  syscall
  move $t3,$v0   #t3=n2
  
  move $s0,$zero  #row counter
  move $s1,$zero  #column counter
    
input:  

  loop1:
    calc($s2,$s0,$s1,$t1)
    li $v0,5
    syscall
    sw $v0,mat1($s2)
    addi $s1,$s1,1
    bne $s1,$t1,loop1
    
    move $s1,$zero
    
    addi $s0,$s0,1
    bne  $s0,$t0,loop1
    
  move $s0,$zero
  move $s1,$zero
      
  loop2:
    calc($s2,$s0,$s1,$t3)
    li $v0,5
    syscall
    sw $v0,mat2($s2)
    addi $s1,$s1,1
    bne $s1,$t3,loop2
    
    move $s1,$zero
    
    addi $s0,$s0,1
    bne  $s0,$t2,loop2
    
    
    
  sub $t0,$t0,$t2      #hang
  addi $t0,$t0,1
  move $t4,$t1
  sub $t1,$t1,$t3      #lie
  addi $t1,$t1,1    
  
  move $s0,$zero  # s0=i
  move $s1,$zero  # s1=j
  move $s2,$zero  # s2=k
  move $s3,$zero  # s3=l
  move $s4,$zero  # s4=i+k
  move $s5,$zero  # s5=j+l
 
  loop3:
  
  add $s4,$s0,$s2
  add $s5,$s1,$s3
  
  calc($t5,$s4,$s5,$t4) #[i+k][j+l]
  calc($t6,$s2,$s3,$t3) #[k][l]
  calc($t7,$s0,$s1,$t1) #[i][j]
  
  lw $t8,mat1($t5)
  lw $t9,mat2($t6)
  lw $s6,mat3($t7)
  
  multu $t8,$t9
  mflo $s7
  addu $s6,$s6,$s7
  
  sw $s6,mat3($t7)
  
  addi $s3,$s3,1
  bne $s3,$t3,loop3
  move $s3,$zero
  
  addi $s2,$s2,1
  bne $s2,$t2,loop3
  move $s2,$zero
  
  addi $s1,$s1,1
  bne $s1,$t1,loop3
  move $s1,$zero
  
  addi $s0,$s0,1
  bne $s0,$t0,loop3
  
  move $s0,$zero  # s0=i
  move $s1,$zero  # s1=j  
  
  
  output:
  move $s0,$zero
  move $s1,$zero
  

  loop4:
  calc($s2,$s0,$s1,$t1)
    
    lw $a0,mat3($s2)
    li $v0,1
    syscall
    
    la $a0,space
    li $v0,4
    syscall
    
    addi $s1,$s1,1
    bne  $s1,$t1,loop4
    
    la  $a0,tab
    li  $v0,4
    syscall
    
    move $s1,$zero
    
    addi $s0,$s0,1
    bne  $s0,$t0,loop4
    
    li $v0,10
    syscall
  
  