`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:20:30 12/30/2020 
// Design Name: 
// Module Name:    I_EXC 
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
`default_nettype none 
`include "heads.v"
module I_EXC(instr_d,pc8_i,bd_i,exccode_i
    );

	input [31:0] instr_d,pc8_i;
	output [5:0] exccode_i;
	output bd_i;
	
	wire [31:0] pc;
	wire [5:0] op,func;
	assign op=instr_d[31:26];
	assign func=instr_d[5:0];
	assign pc=pc8_i-8;
	
	assign bd_i=(op==`beq|op==`bne|op==`bgezbltz|op==`bgtz|op==`blez|op==`jal|op==`j)|((op==`special)&(func==`jr_func|func==`jalr_func));
	
	assign exccode_i=(pc[1:0]!=0|pc<32'h00003000|pc>32'h00004ffc)?`exc_Adel:0;  //另一个值是取0吗


endmodule
