`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:21:40 12/30/2020 
// Design Name: 
// Module Name:    M_EXC 
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

module M_EXC(instr_m,exccode_ml,exccode_mr,addr
    );
	 input [31:0] instr_m,addr;
	 input [5:0] exccode_ml;
	 output [5:0] exccode_mr;
	 wire [5:0] op;
	 assign op=instr_m[31:26];
	 
	 assign exccode_mr=(op==`lw&addr[1:0]!=0)|((op==`lh|op==`lhu)&addr[0]!=0)|
	                   ((op==`lh|op==`lhu|op==`lb|op==`lbu)&addr>32'h2fff)|
                     ((op==`lw)&addr>32'h2fff&!(addr>=32'h7f00&addr<=32'h7f0b|addr>=32'h7f10&addr<=32'h7f1b))?`exc_Adel:
                     (op==`sw&addr[1:0]!=0)|(op==`sh&addr[0]!=0)|
	                   ((op==`sh|op==`sb)&addr>32'h2fff)|
                     ((op==`sw)&addr>32'h2fff&!(addr>=32'h7f00&addr<=32'h7f07|addr>=32'h7f10&addr<=32'h7f17))?`exc_Ades:
                     exccode_ml;
	                   


endmodule
