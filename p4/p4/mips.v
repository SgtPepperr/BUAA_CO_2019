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
module mips(clk,reset);
    input clk;
	 input reset;

wire [31:0] instr;
wire regwrite,memwrite,alusrc,isbeq,cpc;
wire [1:0] cpcop,aluctrl,extop,regdst;
wire [3:0] memtoreg;

DATAPATH datapath (
    .instr(instr), 
    .regdst(regdst), 
    .isbeq(isbeq), 
    .memtoreg(memtoreg), 
    .regwrite(regwrite), 
    .memwrite(memwrite), 
    .alusrc(alusrc), 
    .extop(extop), 
    .cpcop(cpcop), 
    .cpc(cpc), 
    .aluctrl(aluctrl), 
    .reset(reset), 
    .clk(clk)
    );
	 
ctrl control (
    .instr(instr), 
    .regdst(regdst), 
    .isbeq(isbeq), 
    .memtoreg(memtoreg), 
    .regwrite(regwrite), 
    .memwrite(memwrite), 
    .alusrc(alusrc), 
    .extop(extop), 
    .cpcop(cpcop), 
    .cpc(cpc), 
    .aluctrl(aluctrl)
    );

endmodule
