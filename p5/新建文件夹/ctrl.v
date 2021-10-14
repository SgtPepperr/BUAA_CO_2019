`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:59:34 11/18/2020 
// Design Name: 
// Module Name:    ctrl 
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
module CTRL(instr,regdst,isbeq,memtoreg,regwrite,memwrite,alusrc,extop,npcop,npc,aluctrl);
 input [31:0]instr;
 output reg regwrite,memwrite,alusrc,npc;
 output reg [3:0] npcop,aluctrl,extop,regdst,memtoreg;
 output wire isbeq;
 
 wire [5:0] op,func;
 //wire [4:0] rt;
 
 assign op=instr[31:26];
 assign func=instr[5:0];
 //assign rt=instr[20:16];
 
initial begin
    regwrite<=0; memwrite<=0; 
    alusrc<=0; npc<=0; regdst<=0;
    npcop<=0;aluctrl<=0;extop<=0;
    memtoreg<=0;
end

assign isbeq=(op==`beq);

always@(*)begin
    case(op)
    `special:
         begin
             if(func==`addu_func)
               begin
                    regwrite<=1; memwrite<=0; 
                    alusrc<=0; npc<=0; regdst<=`regdst_rd;
                    npcop<=0;aluctrl<=`alu_add;extop<=`ext_zero;
                    memtoreg<=`mtr_alu;   
               end
             else if(func==`subu_func)
               begin
                    regwrite<=1; memwrite<=0; 
                    alusrc<=0; npc<=0; regdst<=`regdst_rd;
                    npcop<=0;aluctrl<=`alu_sub;extop<=`ext_zero;
                    memtoreg<=`mtr_alu;                    
               end
             else if(func==`jr_func)
               begin
                    regwrite<=0; memwrite<=0; 
                    alusrc<=0; npc<=1; regdst<=0;
                    npcop<=`npc_jr;aluctrl<=0;extop<=0;
                    memtoreg<=0;                    
               end
             else 
               begin
                    regwrite<=0; memwrite<=0; 
                    alusrc<=0; npc<=0; regdst<=0;
                    npcop<=0;aluctrl<=0;extop<=0;
                    memtoreg<=0;                     
               end
         end
    `ori:
         begin
                    regwrite<=1; memwrite<=0; 
                    alusrc<=1; npc<=0; regdst<=`regdst_rt;
                    npcop<=0;aluctrl<=`alu_or;extop<=`ext_zero;
                    memtoreg<=`mtr_alu;              
         end
    `lui:
         begin
                    regwrite<=1; memwrite<=0; 
                    alusrc<=1; npc<=0; regdst<=`regdst_rt;
                    npcop<=0;aluctrl<=`alu_add;extop<=`ext_lui;
                    memtoreg<=`mtr_alu;               
         end
    `lw: 
         begin
                    regwrite<=1; memwrite<=0; 
                    alusrc<=1; npc<=0; regdst<=`regdst_rt;
                    npcop<=0;aluctrl<=`alu_add;extop<=`ext_sign;
                    memtoreg<=`mtr_dm;              
         end
    `sw: 
         begin
                    regwrite<=0; memwrite<=1; 
                    alusrc<=1; npc<=0; regdst<=`regdst_rt;
                    npcop<=0;aluctrl<=`alu_add;extop<=`ext_sign;
                    memtoreg<=`mtr_dm;              
         end
    `beq:
         begin
                    regwrite<=0; memwrite<=0; 
                    alusrc<=0; npc<=1; regdst<=0;
                    npcop<=`npc_beq;aluctrl<=0;extop<=`ext_sign;
                    memtoreg<=0; 
         end
    `jal:
         begin
                    regwrite<=1; memwrite<=0; 
                    alusrc<=0; npc<=1; regdst<=`regdst_j31;
                    npcop<=`npc_jal;aluctrl<=0;extop<=0;
                    memtoreg<=`mtr_pc8; 
         end
	 `j:    
     	   begin
                    regwrite<=0; memwrite<=0; 
                    alusrc<=0; npc<=1; regdst<=0;
                    npcop<=`npc_jal;aluctrl<=0;extop<=0;
                    memtoreg<=0; 
         end
    default:
         begin
                    regwrite<=0; memwrite<=0; 
                    alusrc<=0; npc<=0; regdst<=0;
                    npcop<=0;aluctrl<=0;extop<=0;
                    memtoreg<=0; 
         end

    endcase
end
   
endmodule
