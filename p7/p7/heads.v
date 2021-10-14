`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:14:30 11/19/2020 
// Design Name: 
// Module Name:    heads 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`define special 6'b000000

`define bne 6'b000101
`define beq 6'b000100
`define bgezbltz 6'b000001
`define bgtz 6'b000111
`define blez 6'b000110

`define bgez_rt 5'b00001
`define bltz_rt 5'b00000


`define jal 6'b000011
`define j   6'b000010

`define ori 6'b001101
`define lui 6'b001111
`define xori 6'b001110
`define addi 6'b001000
`define addiu 6'b001001
`define andi 6'b001100
`define xori 6'b001110
`define slti 6'b001010
`define sltiu 6'b001011

`define lb  6'b100000
`define lbu 6'b100100
`define lh  6'b100001
`define lhu 6'b100101
`define lw  6'b100011
`define sw  6'b101011
`define sb  6'b101000
`define sh  6'b101001

`define mftc0 6'b010000

`define mfc0_rs 5'b00000
`define mtc0_rs 5'b00100



`define jr_func   6'b001000
`define jalr_func 6'b001001

`define add_func  6'b100000
`define sub_func  6'b100010
`define addu_func 6'b100001
`define subu_func 6'b100011
`define or_func  6'b100101
`define xor_func  6'b100110
`define and_func 6'b100100
`define nor_func 6'b100111

`define sll_func  6'b000000
`define sra_func  6'b000011
`define srl_func  6'b000010
`define sllu_func 6'b000100
`define srau_func 6'b000111
`define srlu_func 6'b000110

`define slt_func 6'b101010
`define sltu_func 6'b101011

`define mult_func 6'b011000
`define multu_func 6'b011001
`define div_func  6'b011010
`define divu_func 6'b011011
`define mfhi_func 6'b010000
`define mflo_func 6'b010010
`define mthi_func 6'b010001
`define mtlo_func 6'b010011

`define eret_func 6'b011000


`define regdst_rt   0
`define regdst_rd   1
`define regdst_j31 2

`define alu_add 0
`define alu_sub 1
`define alu_or 2
`define alu_and 3
`define alu_xor 4
`define alu_nor 5
`define alu_sll 6
`define alu_srl 7
`define alu_sra 8
`define alu_sllu 9
`define alu_srlu 10
`define alu_srau 11
`define alu_slt  12
`define alu_sltu 13

`define ext_zero 0
`define ext_sign 1
`define ext_lui  2

`define mtr_dm   0
`define mtr_alu  1
`define mtr_pc8  2


`define npc_beq  0 
`define npc_jal  1
`define npc_jr   2
`define npc_epc  3

`define T_PC    2'b00
`define T_ALU   2'b01
`define T_DM    2'b10

`define exc_Int 0
`define exc_Adel 4
`define exc_Ades 5
`define exc_Ri 10
`define exc_Ov 12

`define eret   32'h42000018