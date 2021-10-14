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
	 
wire [1:0] muwe,mure;
wire [2:0] dmop,multctrl;
wire [31:0] instr_d,instr_e,instr_m,instr_w;
wire memwrite,alusrc,npc,start,ismu,W_D;
wire [3:0] npcop,aluctrl,extop,regdst,memtoreg,memtoreg_m;

DATAPATH datapath(
    .clk(clk),
    .W_D(W_D),	 
    .reset(reset), 
    .npc(npc), 
    .extop(extop), 
    .npcop(npcop), 
    .aluctrl(aluctrl), 
    .memwrite(memwrite), 
    .instr_d(instr_d), 
    .instr_e(instr_e), 
    .instr_m(instr_m), 
    .instr_w(instr_w), 
    .alusrc(alusrc),
	 .regdst(regdst),
	 .memtoreg(memtoreg),
	 .memtoreg_m(memtoreg_m),
	 .dmop(dmop),
	 .multctrl(multctrl),
	 .start(start),
	 .mure(mure),
	 .muwe(muwe),
	 .ismu(ismu)
    );
	 
CTRL ctrld(
    .instr(instr_d), 
    .regdst(regdst),  
    .extop(extop), 
    .npcop(npcop), 
    .npc(npc),
	 .ismu(ismu),
	 .regwrite(W_D)
    );
	 
CTRL ctrle (
    .instr(instr_e), 
    .alusrc(alusrc), 
    .aluctrl(aluctrl),
	 .multctrl(multctrl),
	 .mure(mure),
	 .muwe(muwe),
	 .start(start)
    );
	 
CTRL ctrlm (
    .instr(instr_m), 
    .memwrite(memwrite), 
	 .memtoreg(memtoreg_m) 
    );	
	 
CTRL ctrlw (
    .instr(instr_w),
    .memtoreg(memtoreg), 
	 .dmop(dmop)
    );

endmodule
