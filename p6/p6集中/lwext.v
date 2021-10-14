`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:49:14 12/22/2020 
// Design Name: 
// Module Name:    LWEXT 
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
module LWEXT(A,Din,Op,DOut);

input [1:0] A;
input [31:0] Din;
input [2:0] Op;
output [31:0] DOut;

wire [7:0] word1;
wire [15:0] word2;

assign word1=(A==0)?Din[7:0]:
             (A==1)?Din[15:8]:
				 (A==2)?Din[23:16]:
				 Din[31:24];

assign word2=(A[1]==0)?Din[15:0]:
              Din[31:16];

assign DOut=(Op==0)?Din:
            (Op==1)?{24'b0,word1}:
				(Op==2)?{{24{word1[7]}},word1}:
				(Op==3)?{16'b0,word2}:
				{{16{word2[15]}},word2};

endmodule
