`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:53:08 11/20/2020 
// Design Name: 
// Module Name:    CPC 
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
module CPC(extout,pctrue,rd1,instr,pcp,cpcop);
   input [31:0] extout,pcp,rd1,instr;
	input [1:0] cpcop;
	output [31:0] pctrue;
	
	wire [31:0] tem[2:0];
	wire [31:0] offset;
	
	assign offset={extout[29:0],2'b00};
	assign tem[0]=pcp+offset;
	assign tem[1]={pcp[31:28],instr[25:0],2'b00};
	assign tem[2]=rd1;

   assign pctrue=tem[cpcop];
endmodule
