`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:49:29 12/08/2020 
// Design Name: 
// Module Name:    cmp 
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
module CMP(a,b,equal,bigeq,big,sma,smaeq);
input [31:0] a,b;
output equal,bigeq,big,sma,smaeq;

assign equal=(a==b)?1:0;
assign bigeq=(a[31]==0)?1:0;
assign big=(a[31]==0&a!=0)?1:0;
assign smaeq=(a[31]==1|a==0)?1:0;
assign sma=(a[31]==1)?1:0;


endmodule
