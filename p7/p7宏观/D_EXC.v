`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:20:37 12/30/2020 
// Design Name: 
// Module Name:    D_EXC 
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
`include "heads.v"
module D_EXC(instr_d,exccode_dl,exccode_dr
    );
input [31:0] instr_d;
input [5:0] exccode_dl;
output [5:0] exccode_dr;

wire [5:0] op,func;
wire [4:0] rs;

assign op=instr_d[31:26];
assign rs=instr_d[25:21];
assign func=instr_d[5:0];


assign exccode_dr=!( (op==`lb)|(op==`lbu)|(op==`lh)|(op==`lhu)|(op==`lw)|
						 (op==`sb)|(op==`sh)|(op==`sw)|
						 (op==`special&(func==`add_func|func==`addu_func|func==`sub_func|func==`subu_func
										|func==`slt_func|func==`sltu_func|func==`sllu_func|func==`srlu_func|
										func==`srau_func|func==`and_func|func==`or_func|func==`xor_func|func==`nor_func))|
						 (op==`special&(func==`sll_func|func==`srl_func|func==`sra_func))|
						 (op==`addi|op==`addiu|op==`andi|op==`ori|op==`xori|op==`slti|op==`sltiu)|
						 (op==`lui)|
						 (op==`beq|op==`bne)|
						 (op==`blez|op==`bgtz|op==`bgezbltz)|
						 (op==`j)|
						 (op==`jal)|
						 (op==`special&func==`jalr_func)|
						 (op==`special&func==`jr_func)|
						 (op==`special&(func==`mfhi_func|func==`mflo_func))|
						 (op==`special&(func==`mthi_func|func==`mtlo_func))|
						 (op==`mftc0&func==`eret_func)|
						 (op==`mftc0&(rs==`mfc0_rs|rs==`mtc0_rs))|
						 (op==`special&(func==`mult_func|func==`multu_func|func==`div_func|func==`divu_func)))?`exc_Ri:exccode_dl;

endmodule
