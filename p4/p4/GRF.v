`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:55:34 11/18/2020 
// Design Name: 
// Module Name:    GRF 
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
module GRF(A1,A2,WA,WD,reset,clk,regwrite,RD1,RD2);
 input [4:0] A1,A2,WA;
 input [31:0] WD;
 input reset,clk,regwrite;
 output [31:0] RD1,RD2;

 integer i;
 reg [31:0] GRFs[31:0];

 initial begin
     for(i=0;i<31;i=i+1)
       GRFs[i]<=0;
 end

 always@(posedge clk)begin
     if(reset)begin
        for(i=0;i<32;i=i+1)
         GRFs[i]<=0;
        end
     else begin
         if(regwrite==1&&WA!=0)begin
             GRFs[WA]<=WD;
				 $display("@%h: $%d <= %h", im.pc, WA, WD);
				 
         end

     end
 end

 assign RD1=GRFs[A1];
 assign RD2=GRFs[A2];

endmodule
