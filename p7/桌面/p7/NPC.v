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
module NPC(extout,pctrue,rd1,instr,pc8,npcop,epc,intreq);
   input intreq; 
   input [31:0] extout,pc8,rd1,instr,epc;
	input [3:0] npcop;
	output [31:0] pctrue;
	
	wire [31:0] tem[5:0];
	wire [31:0] offset;
	wire [31:0] pc,pc4;
	
	assign pc4=pc8-4;
	assign pc=pc8-8;
	
	assign offset={extout[29:0],2'b00};
	assign tem[0]=pc4+offset;  //beq
	assign tem[1]={pc[31:28],instr[25:0],2'b00};  //j,jal
	assign tem[2]=rd1;  //jr
	assign tem[3]=epc;  //eret
	assign tem[4]=32'h00004180;  //intreq

   assign pctrue=(intreq)?tem[4]:tem[npcop];
endmodule
