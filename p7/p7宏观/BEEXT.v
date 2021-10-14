`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:30:07 12/22/2020 
// Design Name: 
// Module Name:    BEEXT 
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
module BEEXT(A1_0,instr_m,beout);
	input [1:0] A1_0;
	input [31:0] instr_m;
	output [3:0] beout;
	
	wire [5:0] op;
	wire sw,sh,sb;
	
	assign op=instr_m[31:26];
	assign sw=(op==`sw);
	assign sh=(op==`sh);
	assign sb=(op==`sb);

assign beout=sw ?4'b1111:
             sh&A1_0[1]==0  ?4'b0011:
             sh&A1_0[1]==1  ?4'b1100:
             sb&A1_0==2'b00 ?4'b0001:				 
             sb&A1_0==2'b01 ?4'b0010:				 
             sb&A1_0==2'b10 ?4'b0100:				 
             sb&A1_0==2'b11 ?4'b1000:
             4'b0000;				 

endmodule
