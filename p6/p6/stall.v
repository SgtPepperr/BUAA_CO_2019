`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:59:01 12/09/2020 
// Design Name: 
// Module Name:    stall 
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
`include "heads.v"
module STALL(instr,Tnew_e,Tnew_m,Tnew_d,a3_e,a3_m,W_E,W_M,stall);

input W_E,W_M;
input [1:0] Tnew_e,Tnew_m;
input [4:0] a3_e,a3_m;
input [31:0] instr;
output stall;
output [1:0] Tnew_d;

wire [4:0] rs,rt;
wire [5:0] op,func;

wire load,store,add,sll,addi,lui,beq,blez,j,jal,jalr,jr,mfhi,mthi,mult;
 
wire Tuse_RS0,Tuse_RS1,Tuse_RT0,Tuse_RT1;
wire stall_RS0_e1,stall_RS0_e2,stall_RS0_m1,stall_RS1_e2;
wire stall_RT0_e1,stall_RT0_e2,stall_RT0_m1,stall_RT1_e2;
wire stall_RS,stall_RT;

assign op=instr[31:26];
assign rs=instr[25:21];
assign rt=instr[20:16];
assign func=instr[5:0];

assign Tuse_RS0=beq|jr|blez|jalr;
assign Tuse_RS1=add|addi|mult|lui|load|store|mthi;

assign Tuse_RT0=beq;
assign Tuse_RT1=add|sll|mult;

assign load=(op==`lb)|(op==`lbu)|(op==`lh)|(op==`lhu)|(op==`lw);
assign store=(op==`sb)|(op==`sh)|(op==`sw);
assign add=(op==`special&(func==`add_func|func==`addu_func|func==`sub_func|func==`subu_func
            |func==`slt_func|func==`sltu_func|func==`sllu_func|func==`srlu_func|
            func==`srau_func|func==`and_func|func==`or_func|func==`xor_func|func==`nor_func));
assign sll=(op==`special&(func==`sll_func|func==`srl_func|func==`sra_func));
assign addi=(op==`addi|op==`addiu|op==`andi|op==`ori|op==`xori|op==`slti|op==`sltiu);
assign lui=(op==`lui);
assign beq=(op==`beq|op==`bne);
assign blez=(op==`blez|op==`bgtz|op==`bgezbltz);
assign j=(op==`j);
assign jal=(op==`jal);
assign jalr=(op==`special&&func==`jalr_func);
assign jr=(op==`special&&func==`jr_func);
assign mfhi=(op==`special&(func==`mfhi_func|func==`mflo_func));
assign mthi=(op==`special&(func==`mthi_func|func==`mtlo_func));
assign mult=(op==`special&(func==`mult_func|func==`multu_func|func==`div_func|func==`divu_func));


assign stall_RS0_e1=Tuse_RS0 & (Tnew_e==2'b01) & (rs==a3_e) & W_E;
assign stall_RS0_e2=Tuse_RS0 & (Tnew_e==2'b10) & (rs==a3_e) & W_E;
assign stall_RS0_m1=Tuse_RS0 & (Tnew_m==2'b01) & (rs==a3_m) & W_M;
assign stall_RS1_e2=Tuse_RS1 & (Tnew_e==2'b10) & (rs==a3_e) & W_E;

assign stall_RS=stall_RS0_e1|stall_RS0_e2|stall_RS0_m1|stall_RS1_e2;

assign stall_RT0_e1=Tuse_RT0 & (Tnew_e==2'b01) & (rt==a3_e) & W_E;
assign stall_RT0_e2=Tuse_RT0 & (Tnew_e==2'b10) & (rt==a3_e) & W_E;
assign stall_RT0_m1=Tuse_RT0 & (Tnew_m==2'b01) & (rt==a3_m) & W_M;
assign stall_RT1_e2=Tuse_RT1 & (Tnew_e==2'b10) & (rt==a3_e) & W_E;

assign stall_RT=stall_RT0_e1|stall_RT0_e2|stall_RT0_m1|stall_RT1_e2;

assign stall=stall_RS|stall_RT;	

assign Tnew_d=(add|sll|addi|lui|mfhi)? `T_ALU :
                             load   ? `T_DM :
               `T_PC;	

endmodule
