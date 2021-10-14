`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:30:07 12/29/2020 
// Design Name: 
// Module Name:    bridge 
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
module BRIDGE(we_cpu,IRQ_t0,IRQ_t1,interrupt,addr_cpu,wdin_cpu,wd_t0,wd_t1,we_t0,we_t1,hwint,wdout_cpu,addr_t,wd_t
    );
	 
	 input we_cpu,IRQ_t0,IRQ_t1,interrupt;
	 input [31:0] addr_cpu,wdin_cpu,wd_t0,wd_t1;
	 
	 output we_t0,we_t1;
	 output [5:0] hwint;
	 output [31:0] wdout_cpu,addr_t,wd_t;
	 wire Hitdevt0,Hitdevt1;
	 
	 assign Hitdevt0=addr_cpu>=32'h00007f00&&addr_cpu<=32'h00007f0b;
	 assign Hitdevt1=addr_cpu>=32'h00007f10&&addr_cpu<=32'h00007f1b;
	 
	 assign addr_t=addr_cpu;
	 assign wd_t=wdin_cpu;
	 
	 assign hwint={3'b0,interrupt,2'b0};
	 
	 assign we_t0=we_cpu&&Hitdevt0;
	 assign we_t1=we_cpu&&Hitdevt1;
	 
	 assign wdout_cpu=(Hitdevt0)?wd_t0:
	             (Hitdevt1)?wd_t1:
					 32'h00000000;//最后结果不知道应该写啥


endmodule
