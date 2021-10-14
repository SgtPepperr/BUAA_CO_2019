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
module DATAPATH(isbeq,clk,reset,npc,regwrite_d,extop,npcop,aluctrl_d,memwrite_d,
                instr_d,alusrc_d,regdst,memtoreg_d);

output [31:0] instr_d;                
input clk,reset,isbeq,regwrite_d,memwrite_d,npc,alusrc_d;
input [3:0] npcop,aluctrl_d,extop,regdst,memtoreg_d;

wire npclogic,stall;
wire [31:0] pctrue,pc8_i,pc8_d,pc8_e,pc8_m,pc8_w,back_m;
wire [31:0] instr_e,instr_m,instr_w;
wire regwrite_e,regwrite_m,regwrite_w;
wire memwrite_e,memwrite_m;
wire alusrc_e;
wire [3:0] aluctrl_e,memtoreg_e,memtoreg_m,memtoreg_w;
wire [31:0] regdata,RD1,RD2,extout,cmp_a,cmp_b,e32_e,instr_i;
wire [31:0] v1_e,v2_e,v2_m;
wire [31:0] alu_a,alu_b,alu_bend,ao_e,ao_m,ao_w,dm_wd,dm_m,dm_w;
wire zero;
wire [1:0] Tnew_d,Tnew_e,Tnew_m;
wire [4:0] a1_d,a2_d,a1_e,a2_e,a3_e,a2_m,a3_m,a3_w,regaddr;

/***********fetch instruction*********/
IM im (
    .clk(clk), 
    .reset(reset), 
    .instr(instr_i), 
    .npc(npclogic), 
    .pctrue(pctrue), 
    .pc8(pc8_i), 
    .stall(stall)
    );
assign npclogic=(npc&~isbeq)|(npc&isbeq&zero);

/***********D_REG*********/
D_REG d_reg (
    .clk(clk), 
    .reset(reset), 
    .noen_d(stall), 
    .instr_i(instr_i), 
    .pc8_i(pc8_i), 
    .instr_d(instr_d), 
    .pc8_d(pc8_d)
    );
	 
/***********Decode*********/
wire [4:0] rs,rt,rd;
wire [15:0] imm;

assign rs=instr_d[25:21]; 
assign rt=instr_d[20:16];
assign rd=instr_d[15:11];
assign imm=instr_d[15:0];

assign a1_d=rs;
assign a2_d=rt;
GRF grf (
    .A1(rs), 
    .A2(rt), 
    .A3(a3_w), 
    .WD(regdata), 
    .reset(reset), 
    .clk(clk), 
    .regwrite(regwrite_w), 
    .RD1(RD1), 
    .RD2(RD2)
    );
	 
EXT ext (
    .imm(imm), 
    .extop(extop), 
    .extout(extout)
    );
	 
CMP cmp (
    .a(cmp_a), 
    .b(cmp_b), 
    .cmpout(zero)
    );
	 
NPC Npc (
    .extout(extout), 
    .pctrue(pctrue), 
    .rd1(cmp_a), 
    .instr(instr_d), 
    .pc8(pc8_d), 
    .npcop(npcop)
    );
	 
	 
	 

assign regaddr=(regdst==`regdst_rt)?rt:
               (regdst==`regdst_rd)?rd:
					5'd31;
					
assign cmp_a=(a1_d==0)?0:
             ((a1_d==a3_e)&(Tnew_e==0)&regwrite_e)?pc8_e:
             ((a1_d==a3_m)&(Tnew_m==0)&regwrite_m)?back_m:
             ((a1_d==a3_w)&regwrite_w)?regdata:
             RD1;
assign cmp_b=(a2_d==0)?0:
             ((a2_d==a3_e)&(Tnew_e==0)&regwrite_e)?pc8_e:
             ((a2_d==a3_m)&(Tnew_m==0)&regwrite_m)?back_m:
             ((a2_d==a3_w)&regwrite_w)?regdata:
             RD2;
				 
		

/***********stall*********/
STALL stal(
    .instr(instr_d), 
    .Tnew_e(Tnew_e), 
    .Tnew_m(Tnew_m), 
    .Tnew_d(Tnew_d), 
    .a3_e(a3_e), 
    .a3_m(a3_m), 
    .W_E(regwrite_e), 
    .W_M(regwrite_m), 
    .stall(stall)
    );
			
	 
/***********E_REG*********/

E_REG e_reg (
    .clk(clk), 
    .reset(reset||stall), 
    .v1_e(v1_e), 
    .v2_e(v2_e), 
    .a3_d(regaddr),	 
    .a3_e(a3_e), 
    .a2_d(a2_d), 
    .a2_e(a2_e), 
    .a1_d(a1_d),
    .a1_e(a1_e), 
    .e32_e(e32_e), 
    .e32_d(extout), 
	 .pc8_d(pc8_d),
    .pc8_e(pc8_e), 
    .v1_d(cmp_a), 
    .v2_d(cmp_b), 
    .instr_e(instr_e), 
    .instr_d(instr_d), 
	 .Tnew_d(Tnew_d),
	 .Tnew_e(Tnew_e),
	 .alusrc_d(alusrc_d), 
    .alusrc_e(alusrc_e), 
    .memtoreg_d(memtoreg_d), 
    .memtoreg_e(memtoreg_e), 
    .regwrite_d(regwrite_d), 
    .regwrite_e(regwrite_e), 
    .memwrite_d(memwrite_d), 
    .memwrite_e(memwrite_e), 
    .aluctrl_d(aluctrl_d), 
    .aluctrl_e(aluctrl_e)
    );
	 


/***********Execute*********/	 

ALU alu (
    .a(alu_a), 
    .b(alu_bend), 
    .aluctrl(aluctrl_e), 
    .ao(ao_e) 
    );
	 
assign alu_a=(a1_e==0)?0:
             ((a1_e==a3_m)&(Tnew_m==0)&regwrite_m)?back_m:
             ((a1_e==a3_w)&regwrite_w)?regdata:
             v1_e;
assign alu_b=(a2_e==0)?0:
             ((a2_e==a3_m)&(Tnew_m==0)&regwrite_m)?back_m:
             ((a2_e==a3_w)&regwrite_w)?regdata:
             v2_e;
assign alu_bend=(alusrc_e==0)?alu_b:e32_e;
	 
/***********M_REG*********/
M_REG m_reg (
    .clk(clk), 
    .reset(reset), 
    .v2_e(alu_b), 
    .v2_m(v2_m), 
    .instr_e(instr_e), 
    .instr_m(instr_m), 
    .ao_e(ao_e), 
    .ao_m(ao_m), 
    .a3_e(a3_e), 
    .a3_m(a3_m), 
	 .a2_e(a2_e),
	 .a2_m(a2_m),
    .pc8_e(pc8_e), 
    .pc8_m(pc8_m),
	 .Tnew_m(Tnew_m),
	 .Tnew_e(Tnew_e),
    .memtoreg_e(memtoreg_e), 
    .memtoreg_m(memtoreg_m), 
    .regwrite_e(regwrite_e), 
    .regwrite_m(regwrite_m), 
    .memwrite_e(memwrite_e), 
    .memwrite_m(memwrite_m)	 
    );
/***********Memory*********/	 
DM  dm (
    .clk(clk), 
    .reset(reset), 
    .MemWrite(memwrite_m), 
    .addr(ao_m), 
    .din(dm_wd), 
    .dout(dm_m)
    );
	 
assign dm_wd=(a2_m==0)?0:
             ((a2_m==a3_w)&regwrite_w)?regdata:
				 v2_m;
				 
assign back_m=(memtoreg_m==`mtr_pc8)?pc8_m:ao_m;
/***********W_REG*********/	 
W_REG w_reg (
    .clk(clk), 
    .reset(reset), 
    .a3_m(a3_m), 
    .a3_w(a3_w), 
    .pc8_m(pc8_m), 
    .pc8_w(pc8_w), 
    .ao_m(ao_m), 
    .ao_w(ao_w), 
    .dm_m(dm_m), 
    .dm_w(dm_w),
	 .instr_m(instr_m),
	 .instr_w(instr_w),
    .memtoreg_m(memtoreg_m), 
    .memtoreg_w(memtoreg_w), 
    .regwrite_m(regwrite_m), 
    .regwrite_w(regwrite_w)
    );
/***********Writeback*********/	 

assign regdata=(memtoreg_w==`mtr_dm )?dm_w:
               (memtoreg_w==`mtr_alu)?ao_w:
					pc8_w;
					
	 




endmodule
