`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:11:51 11/22/2020 
// Design Name: 
// Module Name:    MUXAlusrc 
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
module MUXAlusrc(RD2,extout,Alusrc,B);
  input [31:0] RD2,extout;
  input Alusrc;
  output [31:0]B;

  wire [31:0] tmp[1:0];

  assign tmp[0]=RD2;
  assign tmp[1]=extout;
  assign B=tmp[Alusrc];

endmodule
