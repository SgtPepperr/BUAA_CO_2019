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

wire [31:0] instr_d;
wire regwrite_d,memwrite_d,alusrc_d,isbeq,npc;
wire [3:0] npcop,aluctrl_d,extop,regdst,memtoreg_d;

DATAPATH datapath(
    .isbeq(isbeq), 
    .clk(clk), 
    .reset(reset), 
    .npc(npc), 
    .regwrite_d(regwrite_d), 
    .extop(extop), 
    .npcop(npcop), 
    .aluctrl_d(aluctrl_d), 
    .memwrite_d(memwrite_d), 
    .instr_d(instr_d), 
    .alusrc_d(alusrc_d),
	 .regdst(regdst),
	 .memtoreg_d(memtoreg_d)
    );

CTRL ctrl (
    .instr(instr_d), 
    .regdst(regdst), 
    .isbeq(isbeq), 
    .memtoreg(memtoreg_d), 
    .regwrite(regwrite_d), 
    .memwrite(memwrite_d), 
    .alusrc(alusrc_d), 
    .extop(extop), 
    .npcop(npcop), 
    .npc(npc), 
    .aluctrl(aluctrl_d)
    );
	 


endmodule
