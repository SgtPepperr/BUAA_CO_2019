`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:07:46 12/08/2020 
// Design Name: 
// Module Name:    D_REG 
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
module D_REG(clk,reset,noen_d,instr_i,pc8_i,instr_d,pc8_d,exccode_i,exccode_d,bd_i,bd_d);
   input clk,reset,noen_d,bd_i;
	input [5:0] exccode_i;
   input [31:0] instr_i,pc8_i;
	output reg bd_d;
	output reg [5:0] exccode_d;
   output reg [31:0] instr_d,pc8_d;
   
	initial begin
	  instr_d<=0;
	  pc8_d<=0;
	  exccode_d<=0;
	  bd_d<=0;
	end

    always@(posedge clk)begin
        if(reset)begin
            instr_d<=0;
            pc8_d<=0;
				exccode_d<=0;
				bd_d<=0;
        end
        else if(noen_d)begin
            instr_d<=instr_d;
            pc8_d<=pc8_d;
				exccode_d<=exccode_d;
				bd_d<=bd_d;
        end
        else begin
            instr_d<=instr_i;
            pc8_d<=pc8_i;
				exccode_d<=exccode_i;
				bd_d<=bd_i;
        end
    end
	

endmodule
