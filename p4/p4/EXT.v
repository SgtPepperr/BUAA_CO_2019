`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:54:57 11/18/2020 
// Design Name: 
// Module Name:    EXT 
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
module EXT(imm,extop,extout);
  input [15:0] imm;
  input [1:0] extop;
  output [31:0] extout;

  wire [31:0] extout1[2:0];
  assign extout1[0]={16'b0,imm};
  assign extout1[1]={{16{imm[15]}},imm};
  assign extout1[2]={imm,16'b0};

  assign extout=extout1[extop];

endmodule