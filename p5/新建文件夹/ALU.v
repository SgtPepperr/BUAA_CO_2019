`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:17:16 11/18/2020 
// Design Name: 
// Module Name:    ALU 
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
module ALU(a,b,aluctrl,ao);
 input [31:0] a,b;
 input [3:0]  aluctrl;
 output [31:0] ao;

 wire [31:0] out1[3:0];

 assign out1[0]=a+b;
 assign out1[1]=a-b;
 assign out1[2]=a|b;
 assign ao=out1[aluctrl];
 
endmodule
