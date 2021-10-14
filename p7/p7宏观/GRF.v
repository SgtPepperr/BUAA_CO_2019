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
module GRF(A1,A2,A3,WD,reset,clk,regwrite,RD1,RD2);
 input [4:0] A1,A2,A3;
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
         if(regwrite==1&&A3!=0)begin
             GRFs[A3]<=WD;
		 $display("%d@%h: $%d <= %h", $time,DATAPATH.pc8_w-8, A3, WD);
				 
         end

     end
 end

 assign RD1=(regwrite&&A1==A3&&A3)?WD:GRFs[A1];
 assign RD2=(regwrite&&A2==A3&&A3)?WD:GRFs[A2]; //内部转发

endmodule
