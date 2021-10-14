`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:12:23 11/22/2020 
// Design Name: 
// Module Name:    MUXmtr 
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
module MUXmtr(dm,alu,ext,pc4,memtoreg,mtrout);
  input [31:0] dm,alu,ext,pc4;
  input [3:0] memtoreg;
  output [31:0] mtrout;

  wire [31:0] tmp[3:0];

  assign tmp[0]=dm;
  assign tmp[1]=alu;
  assign tmp[2]=ext;
  assign tmp[3]=pc4;
  assign mtrout=tmp[memtoreg];

endmodule
