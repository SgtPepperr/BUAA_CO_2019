`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:09:22 12/08/2020 
// Design Name: 
// Module Name:    W_REG 
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
module W_REG(clk,reset,a3_m,a3_w,pc8_m,pc8_w,ao_m,ao_w,dm_m,dm_w,instr_m,instr_w);
input clk,reset;
input [4:0] a3_m;
input [31:0] pc8_m,ao_m,dm_m,instr_m;
output reg [4:0] a3_w;
output reg [31:0] pc8_w,ao_w,dm_w,instr_w;

initial begin
    a3_w<=0;
    pc8_w<=0;
    ao_w<=0;
    dm_w<=0;
	 instr_w<=0;
end

always@(posedge clk)begin
    if(reset)begin
        a3_w<=0;
        pc8_w<=0;
        ao_w<=0;
        dm_w<=0;
		  instr_w<=0;
    end
    else begin
        a3_w<=a3_m;
        pc8_w<=pc8_m;
        ao_w<=ao_m;
        dm_w<=dm_m; 
		  instr_w<=instr_m;
    end        
end

endmodule
