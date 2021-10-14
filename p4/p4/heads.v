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
`define ori 6'b001101
`define lui 6'b001111
`define lw  6'b100011
`define sw  6'b101011
`define beq 6'b000100
`define jal 6'b000011



`define addu_func 6'b100001
`define subu_func 6'b100011
`define jr_func   6'b001000

`define regdst_rt   0
`define regdst_rd   1
`define regdst_j_31 2

`define alu_add 0
`define alu_sub 1
`define alu_ori 2

`define ext_zero 0
`define ext_sign 1
`define ext_lui  2

`define mtr_dm   0
`define mtr_alu  1
`define mtr_ext  2
`define mtr_pc4  3

`define cpc_beq  0 
`define cpc_jal  1
`define cpc_jr   2