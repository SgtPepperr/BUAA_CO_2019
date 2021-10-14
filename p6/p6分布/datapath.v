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
module DATAPATH(clk,reset,npc,regwrite,extop,npcop,W_E,W_M,aluctrl,memwrite,
                instr_d,instr_e,instr_m,instr_w,alusrc,regdst,memtoreg,memtoreg_m,dmop,multctrl,mure,muwe,start,ismu);

output [31:0] instr_d,instr_e,instr_m,instr_w;                
input clk,reset,W_E,W_M,regwrite,memwrite,npc,alusrc,start,ismu;
input [1:0] mure,muwe;
input [2:0] multctrl,dmop;
input [3:0] npcop,aluctrl,extop,regdst,memtoreg,memtoreg_m;

wire npclogic,stall1,stall2,busy;
wire [31:0] pctrue,pc8_i,pc8_d,pc8_e,pc8_m,pc8_w,back_m,hi,lo,ao;
wire [31:0] regdata,RD1,RD2,extout,cmp_a,cmp_b,e32_e,instr_i;
wire [31:0] v1_e,v2_e,v2_m;
wire [31:0] alu_a,alu_b,alu_bend,ao_e,ao_m,ao_w,dm_wd,dm_m,dm_w,dm_wfin;
wire equal,bigeq,smaeq,big,sma;
wire [1:0] Tnew_d,Tnew_e,Tnew_m,A1_0_m,A1_0_w;
wire [3:0] be;
wire [4:0] a1_d,a2_d,a1_e,a2_e,a3_e,a2_m,a3_m,a3_w,regaddr;

/***********fetch instruction*********/
IM im (
    .clk(clk), 
    .reset(reset), 
    .instr(instr_i), 
    .npc(npclogic), 
    .pctrue(pctrue), 
    .pc8(pc8_i), 
    .stall(stall1|stall2)
    );


/***********D_REG*********/
D_REG d_reg (
    .clk(clk), 
    .reset(reset), 
    .noen_d(stall1|stall2), 
    .instr_i(instr_i), 
    .pc8_i(pc8_i), 
    .instr_d(instr_d), 
    .pc8_d(pc8_d)
    );
	 
/***********Decode*********/
wire [4:0] rs,rt,rd;
wire [5:0] op;
wire [15:0] imm;

assign op=instr_d[31:26];
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
    .regwrite(regwrite), 
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
    .equal(equal), 
    .bigeq(bigeq), 
    .big(big), 
    .sma(sma), 
    .smaeq(smaeq)
    );
	 
NPC Npc (
    .extout(extout), 
    .pctrue(pctrue), 
    .rd1(cmp_a), 
    .instr(instr_d), 
    .pc8(pc8_d), 
    .npcop(npcop)
    );
	 
assign npclogic=(npc&~(op==`beq|op==`bne|op==`blez|op==`bgtz|op==`bgezbltz))|(op==`beq&equal)|(op==`bne&~equal)|
                (op==`blez&smaeq)|(op==`bgtz&big)|(op==`bgezbltz&rt==`bltz_rt&sma)|(op==`bgezbltz&rt==`bgez_rt&bigeq);
	 

assign regaddr=(regdst==`regdst_rt)?rt:
               (regdst==`regdst_rd)?rd:
					5'd31;
					
assign cmp_a=(a1_d==0)?0:
             ((a1_d==a3_e)&(Tnew_e==0)&W_E)?pc8_e:
             ((a1_d==a3_m)&(Tnew_m==0)&W_M)?back_m:
             ((a1_d==a3_w)&regwrite)?regdata:
             RD1;
assign cmp_b=(a2_d==0)?0:
             ((a2_d==a3_e)&(Tnew_e==0)&W_E)?pc8_e:
             ((a2_d==a3_m)&(Tnew_m==0)&W_M)?back_m:
             ((a2_d==a3_w)&regwrite)?regdata:
             RD2;
				 
		

/***********stall*********/
STALL stal(
    .instr(instr_d), 
    .Tnew_e(Tnew_e), 
    .Tnew_m(Tnew_m), 
    .Tnew_d(Tnew_d), 
    .a3_e(a3_e), 
    .a3_m(a3_m), 
    .W_E(W_E), 
    .W_M(W_M), 
    .stall(stall1)
    );
			
assign stall2=(ismu&&(busy||start));			
/***********E_REG*********/

E_REG e_reg (
    .clk(clk), 
    .reset(reset||stall1||stall2), 
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
	 .Tnew_e(Tnew_e)
    );

/***********Execute*********/	 

ALU alu (
    .a(alu_a), 
    .b(alu_bend), 
    .aluctrl(aluctrl), 
	 .instr_e(instr_e),
    .ao(ao) 
    );

MULTMO multmo (
    .clk(clk), 
    .reset(reset), 
    .D1(alu_a), 
    .D2(alu_b), 
    .multctrl(multctrl), 
    .busy(busy), 
    .start(start), 
    .hi(hi), 
    .lo(lo), 
    .we(muwe)
    );
	 
assign alu_a=(a1_e==0)?0:
             ((a1_e==a3_m)&(Tnew_m==0)&W_M)?back_m:
             ((a1_e==a3_w)&regwrite)?regdata:
             v1_e;
assign alu_b=(a2_e==0)?0:
             ((a2_e==a3_m)&(Tnew_m==0)&W_M)?back_m:
             ((a2_e==a3_w)&regwrite)?regdata:
             v2_e;
assign alu_bend=(alusrc==0)?alu_b:e32_e;

assign ao_e=(mure==1)?hi:
            (mure==2)?lo:
				ao;
	 
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
	 .Tnew_e(Tnew_e)	 
    );
/***********Memory*********/	 
DM  dm (
    .clk(clk), 
    .reset(reset), 
    .MemWrite(memwrite), 
    .addr(ao_m), 
    .din(dm_wd), 
    .dout(dm_m),
	 .be(be)
    );
	 
BEEXT beext (
    .A1_0(A1_0_m), 
    .instr_m(instr_m), 
    .beout(be)
    );
	 
assign A1_0_m=ao_m[1:0];

assign dm_wd=(a2_m==0)?0:
             ((a2_m==a3_w)&regwrite)?regdata:
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
	 .instr_w(instr_w)
    );
/***********Writeback*********/	 

assign regdata=(memtoreg==`mtr_dm )?dm_wfin:
               (memtoreg==`mtr_alu)?ao_w:
					pc8_w;

assign A1_0_w=ao_w[1:0];
					
LWEXT lwext (
    .A(A1_0_w), 
    .Din(dm_w), 
    .Op(dmop), 
    .DOut(dm_wfin)
    );
					
	 




endmodule
