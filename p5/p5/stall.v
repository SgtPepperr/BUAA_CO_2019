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

wire addu,subu,jr,beq,ori,lui,lw,sw;
 
wire Tuse_RS0,Tuse_RS1,Tuse_RT0,Tuse_RT1;
wire stall_RS0_e1,stall_RS0_e2,stall_RS0_m1,stall_RS1_e2;
wire stall_RT0_e1,stall_RT0_e2,stall_RT0_m1,stall_RT1_e2;
wire stall_RS,stall_RT;

assign op=instr[31:26];
assign rs=instr[25:21];
assign rt=instr[20:16];
assign func=instr[5:0];

assign Tuse_RS0=beq|jr;
assign Tuse_RS1=addu|subu|ori|lui|lw|sw;

assign Tuse_RT0=beq;
assign Tuse_RT1=addu|subu;

assign addu=(op==`special)&(func==`addu_func);
assign subu=(op==`special)&(func==`subu_func);
assign jr=(op==`special)&(func==`jr_func);
assign beq=(op==`beq);
assign ori=(op==`ori);
assign lui=(op==`lui);
assign lw=(op==`lw);
assign sw=(op==`sw);



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

assign Tnew_d=(addu|subu|lui|ori)? `T_ALU :
                             lw   ? `T_DM :
               `T_PC;	

endmodule
