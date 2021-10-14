`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:10:44 11/22/2020 
// Design Name: 
// Module Name:    MUXregdst 
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
module MUXregdst(rt,rd,regdst,WA);
  input [31:0] rt,rd;
  input [1:0] regdst;
  output [31:0] WA;

  wire [31:0] tmp[2:0];

  assign tmp[0]=rt; 
  assign tmp[1]=rd;
  assign tmp[2]=31;
  assign WA=tmp[regdst];

endmodule
