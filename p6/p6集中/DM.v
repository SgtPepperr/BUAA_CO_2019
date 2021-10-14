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
module DM(clk,reset,MemWrite,addr,din,dout,be);
   input clk;
	input reset;
	input MemWrite;
	input [31:0] addr,din;
	input [3:0] be;
	output [31:0] dout;
  integer i;
	
	reg [31:0] ram[4095:0];
	reg [31:0] newcon;
	wire [31:0] con;

	
assign con=ram[addr[13:2]];

always@(*)begin
  if(be==4'b1111)begin
    newcon<=din;
	end
	else if(be==4'b0011)begin
	 newcon[31:16]<=con[31:16];
	 newcon[15:0]<=din[15:0];
	 end
	else if(be==4'b1100)begin
	 newcon[15:0]<=con[15:0];
	 newcon[31:16]<=din[15:0];
	 end
	else if(be==4'b0001)begin
	 newcon[31:8]<=con[31:8];
	 newcon[7:0]<=din[7:0];
	 end
	else if(be==4'b0010)begin
	 newcon[31:16]<=con[31:16];
	 newcon[15:8]<=din[7:0];
	 newcon[7:0]<=con[7:0];
	 end
	else if(be==4'b0100)begin
	 newcon[31:24]<=con[31:24];
	 newcon[23:16]<=din[7:0];
	 newcon[15:0]<=con[15:0];
	 end
	else if(be==4'b1000)begin
	 newcon[23:0]<=con[23:0];
	 newcon[31:24]<=din[7:0];
	 end
	else begin
	 newcon<=con;
	 end

end
   
initial begin
   for(i=0;i<4096;i=i+1)
	   ram[i]<=0;
end

always@(posedge clk)
    begin
	    if(reset)
            begin
               for(i=0;i<4096;i=i+1)
                 ram[i]<=0;
             end	
      else
        begin
          if(MemWrite)
           begin
             ram[addr[13:2]]<=newcon; 
				 $display("%d@%h: *%h <= %h",$time, DATAPATH.pc8_m-8, {addr[31:2],2'b00}, newcon); 
				
           end				 
        end
    end
			
assign dout=ram[addr[13:2]];			
			
endmodule
