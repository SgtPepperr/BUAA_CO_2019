`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:08:49 12/08/2020 
// Design Name: 
// Module Name:    M_REG 
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
module M_REG(clk,reset,v2_e,v2_m,instr_e,instr_m,ao_e,ao_m,a3_e,a3_m,a2_e,a2_m,pc8_e,pc8_m,Tnew_m,Tnew_e);
  input clk,reset;
  input [1:0] Tnew_e;
  input [4:0] a3_e,a2_e;
  input [31:0] v2_e,instr_e,ao_e,pc8_e;
  output reg [1:0] Tnew_m;
  output reg [4:0] a3_m,a2_m;
  output reg [31:0] v2_m,instr_m,ao_m,pc8_m;

  initial begin
      a3_m<=0;
      a2_m<=0;
      v2_m<=0;
      instr_m<=0;
      ao_m<=0;
      pc8_m<=0;
		Tnew_m<=0;
  end

  always@(posedge clk)begin
      if(reset)begin
      a3_m<=0;
      a2_m<=0;
      v2_m<=0;
      instr_m<=0;
      ao_m<=0;
      pc8_m<=0;
		Tnew_m<=0;
      end
      else begin
      a3_m<=a3_e;
      a2_m<=a2_e;
      v2_m<=v2_e;
      instr_m<=instr_e;
      ao_m<=ao_e;
      pc8_m<=pc8_e;
		
      if(Tnew_e==2)
         Tnew_m<=1;
      else
         Tnew_m<=0;		
      end
  end
endmodule