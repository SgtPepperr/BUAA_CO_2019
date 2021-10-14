`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:16:42 11/18/2020 
// Design Name: 
// Module Name:    DM 
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
module DM(clk,reset,MemWrite,addr,din,dout);
   input clk;
	input reset;
	input MemWrite;
	input [31:0] addr;
	input [31:0] din;
	output [31:0] dout;
  integer i;
	
	reg [31:0] ram[1023:0];

initial begin
   for(i=0;i<1024;i=i+1)
	   ram[i]<=0;
end

always@(posedge clk)
    begin
	    if(reset)
            begin
               for(i=0;i<1024;i=i+1)
                 ram[i]<=0;
             end	
      else
        begin
          if(MemWrite)
           begin
             ram[addr[11:2]]<=din; 
				 $display("%d@%h: *%h <= %h",$time, DATAPATH.pc8_m-8, {addr[31:2],2'b00}, din); 
           end				 
        end
    end
			
assign dout=ram[addr[11:2]];			
			
endmodule
