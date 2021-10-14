`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:14:26 11/18/2020 
// Design Name: 
// Module Name:    mips 
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
`default_nettype none
module mips(clk,reset,interrupt,addr);

  input clk,reset,interrupt;
  output [31:0] addr;
  
  wire [5:0] hwint;
  wire we_cpu;
  wire [31:0] pc8_m,addr_cpu,wdin_cpu,wdout_cpu;
  wire IRQ_t0,IRQ_t1,we_t0,we_t1;
  wire [31:0] wd_t0,wd_t1,addr_t,wd_t;

assign addr={pc8_m[31:2],2'b00}-8;

CPU cpu (
    .clk(clk), 
    .reset(reset), 
    .hwint(hwint), 
    .bridge_in(wdout_cpu), 
    .cpuout(wdin_cpu), 
    .addr_all(addr_cpu), 
    .pc8_m(pc8_m), 
    .bridgewe(we_cpu)
    );
	 
BRIDGE bridge (
    .we_cpu(we_cpu), 
    .IRQ_t0(IRQ_t0), 
    .IRQ_t1(IRQ_t1), 
    .interrupt(interrupt), 
    .addr_cpu(addr_cpu), 
    .wdin_cpu(wdin_cpu), 
    .wd_t0(wd_t0), 
    .wd_t1(wd_t1), 
    .we_t0(we_t0), 
    .we_t1(we_t1), 
    .hwint(hwint), 
    .wdout_cpu(wdout_cpu), 
    .addr_t(addr_t), 
    .wd_t(wd_t)
    );
	 
TIMER timer0 (
    .clk(clk), 
    .reset(reset), 
    .Addr(addr_t), 
    .WE(we_t0), 
    .Din(wd_t), 
    .Dout(wd_t0), 
    .IRQ(IRQ_t0)
    );
	
TIMER timer1 (
    .clk(clk), 
    .reset(reset), 
    .Addr(addr_t), 
    .WE(we_t1), 
    .Din(wd_t), 
    .Dout(wd_t1), 
    .IRQ(IRQ_t1)
    );
	 
	 
endmodule