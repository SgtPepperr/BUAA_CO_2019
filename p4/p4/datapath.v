`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:59:53 11/18/2020 
// Design Name: 
// Module Name:    datapath 
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
module DATAPATH(instr,regdst,isbeq,memtoreg,regwrite,memwrite,alusrc,extop,cpcop,cpc,aluctrl,reset,clk);

output [31:0] instr;
input regwrite,memwrite,alusrc,isbeq,cpc,reset,clk;
input [1:0] cpcop,aluctrl,extop,regdst;
input [3:0] memtoreg;

wire [4:0] rs,rt,rd,shamt;
wire [5:0] op,func; 
wire [15:0] imm;
wire [31:0] RD1,RD2,B,aluresult,pcp,pctrue,extout,dout,WA,mtrout;
wire zero,cpctrue;


assign op=instr[31:26];
assign rs=instr[25:21];
assign rt=instr[20:16];
assign rd=instr[15:11];
assign imm=instr[15:0];
assign shamt=instr[10:6];
assign func=instr[5:0];
assign cpctrue=(cpc&~isbeq)|(cpc&isbeq&zero);

ALU alu (
    .a(RD1), 
    .b(B), 
    .aluctrl(aluctrl), 
    .out(aluresult), 
    .zero(zero)
    );
	 
IM  im (
    .clk(clk), 
    .reset(reset), 
    .instr(instr), 
    .cpc(cpctrue), 
    .pctrue(pctrue), 
    .pcp(pcp)
    );
	  
GRF grf (
    .A1(rs), 
    .A2(rt), 
    .WA(WA), 
    .WD(mtrout), 
    .reset(reset), 
    .clk(clk), 
    .regwrite(regwrite), 
    .RD1(RD1), 
    .RD2(RD2)
    );
	 
EXT ext (
    .imm(imm), 
    .extop(extop), 
    .extout(extout)
    );
	 
DM  dm (
    .clk(clk), 
    .reset(reset), 
    .MemWrite(memwrite), 
    .addr(aluresult), 
    .din(RD2), 
    .dout(dout)
    );
	 
CPC cpc1 (
    .extout(extout), 
    .pctrue(pctrue), 
    .rd1(RD1), 
    .instr(instr), 
    .pcp(pcp), 
    .cpcop(cpcop)
    );
	 
MUXAlusrc muxalusrc(
    .RD2(RD2), 
    .extout(extout), 
    .Alusrc(alusrc), 
    .B(B)
    );

MUXmtr muxmtr (
    .dm(dout), 
    .alu(aluresult), 
    .ext(extout), 
    .pc4(pcp), 
    .memtoreg(memtoreg), 
    .mtrout(mtrout)
    );
	 
MUXregdst muxregdst (
    .rt(rt), 
    .rd(rd), 
    .regdst(regdst), 
    .WA(WA)
    );



endmodule
