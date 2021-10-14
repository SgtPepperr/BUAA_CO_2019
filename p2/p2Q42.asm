.data
symbol: .word 0:7
array: .word 0:7
stack1: .word 0:300
stack: .word 0:300
space: .asciiz" "
tab: .asciiz"\n"


.macro listAddress(%t,%s)
move $t9,%t
sll  $t9,$t9,2
la   $v0,%s
add  $v0,$v0,$t9
.end_macro



.macro End(%c,%ta,%be)
addi   %c,%c,1
bne    %ta,%c,%be
.end_macro


.macro Begin(%c,%begin)
  li %c,0
  %begin:
.end_macro

.macro fullArray(%index)
j firstBegin

wholeBegin:
 sw  $ra,($sp)
 subi   $sp,$sp,4
 
 
 firstBegin:
 sub $t0,%index,$s7
 bltz $t0,notout
 
    Begin($t0,outBegin)
    listAddress($t0,array)
    lw  $a0,($v0)
    li $v0,1
    syscall
    la $a0,space
    li $v0,4
    syscall
    End($t0,$s7,outBegin)
    la  $a0,tab
    li  $v0,4
    syscall
    
    notout:
    Begin($t0,theBegin)
    
    listAddress($t0,symbol)
    lw  $t1,($v0)
    bnez $t1,next
    
    listAddress(%index,array)
    addi  $t1,$t0,1
    sw $t1,($v0)
    
    listAddress($t0,symbol)
    li $t1,1
    sw $t1,($v0)
    
    sw $t0,($sp)
    subi $sp,$sp,4
    sw %index,($sp)
    subi $sp,$sp,4
    
    addi %index,%index,1
    jal  wholeBegin
    
    addi   $sp,$sp,4
    lw   %index,($sp)
    addi   $sp,$sp,4
    lw   $t0,($sp)
    
    
    listAddress($t0,symbol)
    sw $zero,($v0)
    
    next:
    End($t0,$s7,theBegin)
 
 beq    %index,$zero,endF
 addi $sp,$sp,4
 lw  $ra,($sp)
 jr $ra
 endF:
 .end_macro
 
 .text
 li $v0,5
 syscall
 move $s7,$v0
 li $s0,0
 
 fullArray($s0)
 li   $v0,10
 syscall