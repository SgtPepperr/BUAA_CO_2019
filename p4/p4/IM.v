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
module IM(clk,reset,instr,cpc,pctrue,pcp);
 input clk,reset,cpc;
 input [31:0] pctrue;
 output [31:0] instr,pcp;
 

 
 reg [31:0] pc;
 reg [31:0] rom[1023:0];
 integer i;

 wire [31:0] pcr;
  initial begin
    for(i=0;i<1024;i=i+1)
       rom[i]=0;
    pc=32'h00003000;
    $readmemh("code.txt",rom,0,1023);
  end

  always@(posedge clk)begin
       if(reset)
         begin
            pc<=32'h00003000;
         end
       else  
		   begin
		     if(cpc)
		       pc<=pctrue;
		     else 
             pc<=pc+4;
         end
  end
  assign pcr=pc-32'h00003000;
  assign instr=rom[pcr[11:2]];
  assign pcp=pc+4;

  endmodule