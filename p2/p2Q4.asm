.data
symbol: .word 0:7
array:  .word 0:7
stack:  .word 0:400
space: .asciiz " "
tab:   .asciiz "\n"

.text
li $v0,5
syscall
move $t0,$v0       #to=n
move $a0,$zero     #a0=segmengt

la $sp,stack      
addiu $sp,$sp,300
jal fullarray


li $v0,10    
syscall

fullarray:
  sub $t1,$a0,$t0   
  bltz $t1,work     #if index<n to work
                    #else for  
  move $t2,$zero      #t2=i
  
  for_loop1:
  slt $t1,$t2,$t0    #t2<t0  normal
  beq $t1,$zero,for_1_end   
  
  sll $t1,$t2,2      #
  lw $t3,array($t1)
  move $a0,$t3       #t3=array[i]
  li $v0,1
  syscall                    #output  number
  
  la $a0,space
  li $v0,4            #output space
  syscall       
  
  addi $t2,$t2,1
  j for_loop1                       
  
  for_1_end:
  la $a0,tab
  li $v0,4                  #output tab
  syscall
  
  jr $ra
  
  
  
  
 work:
     #t1=index
   
   move $t3,$zero    #t3=i
   for_loop2:
   slt $t4,$t3,$t0    #i<n continue
   beq $t4,$zero,else2 
   
   sll $t5,$t3,2 
   lw $t6,symbol($t5)     #t6=symbol[i]
   
   bne $t6,$zero,else1    #!=else
     li $t7,1 
     sw $t7,symbol($t5)   #symbol[i]=1
     
     sll $t5,$a0,2 
     li $t7,1 
     add $t7,$t7,$t3 
     sw $t7,array($t5)   #array[index]=i+1
     
  sw    $ra,0($sp) 
  subi  $sp,$sp,4 
  sw    $t3,0($sp)
  subi  $sp,$sp,4 
  sw    $a0,0($sp)  
  subi  $sp,$sp,4        #store ra and i
     
  addi $a0,$a0,1            #index=index+1
  
  jal fullarray    
      
  addi $sp,$sp,4
  lw $a0,0($sp) 
  addi $sp,$sp,4       #get ra and i  
  lw $t3,0($sp)
  addi $sp,$sp,4  
  lw $ra,0($sp)  
  
  sll $t5,$t3,2  
  li $t7,0  
  sw $t7,symbol($t5)   #symbol[i]=0  
  
   else1:
   addi $t3,$t3,1
   j for_loop2
   
   else2:
   jr $ra
   
   







