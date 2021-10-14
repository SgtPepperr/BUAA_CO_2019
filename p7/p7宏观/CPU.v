`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:49:55 12/31/2020 
// Design Name: 
// Module Name:    CPU 
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
`include "heads.v" 
module CPU(clk,reset,hwint,bridge_in,cpuout,addr_all,MacroPC,bridgewe);
    input clk;
	 input reset;
	 input [5:0] hwint;
	 input [31:0] bridge_in;
	 
	 output [31:0] cpuout,addr_all,MacroPC;
	 output bridgewe;
	 
wire [1:0] muwe,mure;
wire [2:0] dmop,multctrl;
wire [31:0] instr_d,instr_e,instr_m,instr_w;
wire memwrite,dmwe,alusrc,npc,start,ismu,W_D,bd,intreq,ismfc0,ismtc0,iseret,exlclr;
wire [5:0] exccode;
wire [4:0] cp0dst;
wire [31:0] epc,dout_cp0; 
wire [3:0] npcop,aluctrl,extop,regdst,memtoreg,memtoreg_m;

assign exlclr=(instr_m==`eret);
assign dmwe=memwrite&addr_all>=32'h00000000&addr_all<=32'h00002fff;
assign bridgewe=(memwrite==1)&&((addr_all>=32'h00007f00&&addr_all<=32'h00007f07)||(addr_all>=32'h00007f10&&addr_all<=32'h00007f17))&&~intreq;

DATAPATH datapath(
    .clk(clk),
    .W_D(W_D),	 
    .reset(reset), 
    .npc(npc), 
    .extop(extop), 
    .npcop(npcop), 
    .aluctrl(aluctrl), 
    .memwrite(dmwe), 
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
	 .ismu(ismu),
	 .MacroBD(bd),
	 .exccode_mr(exccode),
	 .epc(epc),
	 .bridge_in(bridge_in),
	 .dout_cp0(dout_cp0),
	 .intreq(intreq),
	 .ismfc0(ismfc0),
	 .cp0dst(cp0dst),
	 .MacroPC(MacroPC),
	 .cpuout(cpuout),
	 .addr_all(addr_all),
	 .iseret(iseret)
    );
	 
CTRL ctrld(
    .instr(instr_d), 
    .regdst(regdst),  
    .extop(extop), 
    .npcop(npcop), 
    .npc(npc),
	 .ismu(ismu),
	 .iseret(iseret),
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
	 .memtoreg(memtoreg_m),
    .ismfc0(ismfc0),
    .ismtc0(ismtc0)	 
    );	
	 
CTRL ctrlw (
    .instr(instr_w),
    .memtoreg(memtoreg), 
	 .dmop(dmop)
    );
	 
CP0 cp0 (
    .clk(clk), 
    .reset(reset), 
    .exccode0(exccode), 
    .din_cp0(cpuout), 
    .dout_cp0(dout_cp0), 
    .a1(cp0dst), 
    .a2(cp0dst), 
    .MacroPC(MacroPC),
    .bd_cp0(bd), 
    .we(ismtc0), 
    .hwint(hwint), 
    .epc_cp0(epc), 
    .exlclr(exlclr),  
    .intreq(intreq)
    );

endmodule
