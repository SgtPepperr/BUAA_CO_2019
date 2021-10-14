`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:16:55 11/18/2020 
// Design Name: 
// Module Name:    IM 
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
module IM(clk,reset,instr,npc,pctrue,pc8,stall,intreq);
 input clk,reset,npc,stall,intreq;
 input [31:0] pctrue;
 output [31:0] instr,pc8;
 

 
 reg [31:0] pc;
 reg [31:0] rom[4095:0];
 integer i;

 wire [31:0] pcr;
  initial begin
    for(i=0;i<4096;i=i+1)
       rom[i]=0;
    pc=32'h00003000;
    $readmemh("code.txt",rom);
	 $readmemh("code_handler.txt",rom,1120,2047);
  end

  always@(posedge clk)begin
       if(reset)
         begin
            pc<=32'h00003000;
         end
       else  
		   begin
			  if(intreq)
			    pc<=pctrue;
		     else if(stall)
		       pc<=pc;
			  else if(npc)
			    pc<=pctrue;
		     else 
             pc<=pc+4;
         end
  end
  assign pcr=pc-32'h00003000;
  assign instr=rom[pcr[31:2]];
  assign pc8=pc+8;

  endmodule