`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:08:20 12/08/2020 
// Design Name: 
// Module Name:    E_REG 
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
module E_REG(clk,reset,v1_e,v2_e,a3_e,a3_d,e32_e,e32_d,pc8_e,v1_d,v2_d,instr_e,instr_d,pc8_d,Tnew_e,Tnew_d,a2_e,a2_d,a1_e,a1_d);
   input clk,reset;
	input [1:0] Tnew_d;
   input [4:0]  a3_d,a2_d,a1_d;
   input [31:0] e32_d,instr_d,pc8_d,v1_d,v2_d;
	output reg [1:0] Tnew_e;
   output reg [4:0] a3_e,a2_e,a1_e;
   output reg [31:0] v1_e,v2_e,e32_e,pc8_e,instr_e;

   initial begin
       v1_e<=0;
       v2_e<=0;
       e32_e<=0;
       pc8_e<=0;
       instr_e<=0;
       a3_e<=0;
       a2_e<=0;
       a1_e<=0;
		 Tnew_e<=0;
   end

   always@(posedge clk)begin
       if(reset)begin
            v1_e<=0;
            v2_e<=0;
            e32_e<=0;
            pc8_e<=0;
            instr_e<=0;
            a3_e<=0;
            a2_e<=0;
            a1_e<=0;
				Tnew_e<=0;
       end
       else begin
            v1_e<=v1_d;
            v2_e<=v2_d;
            e32_e<=e32_d;
            pc8_e<=pc8_d;
            instr_e<=instr_d;
            a3_e<=a3_d;
            a2_e<=a2_d;
            a1_e<=a1_d;
				Tnew_e<=Tnew_d;
       end
   end

endmodule