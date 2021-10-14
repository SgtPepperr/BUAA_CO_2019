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
module CTRL(instr,regdst,memtoreg,regwrite,ismtc0,ismfc0,iseret,memwrite,alusrc,extop,npcop,npc,aluctrl,multctrl,dmop,muwe,mure,start,ismu);
 input [31:0]instr;
 output reg regwrite,memwrite,alusrc,npc;
 output wire [1:0] muwe,mure;
 output wire [2:0] multctrl,dmop;
 output wire start,ismu;
 output reg [3:0] npcop,aluctrl,extop,regdst,memtoreg;
 output ismtc0,ismfc0,iseret;
 
 integer temp;
 wire [5:0] op,func;
 wire [4:0] rs;
 //wire [4:0] rt;
 
 assign op=instr[31:26];
 assign rs=instr[25:21];
 assign func=instr[5:0];
 //assign rt=instr[20:16];
 
initial begin
    regwrite<=0; memwrite<=0; 
    alusrc<=0; npc<=0; regdst<=0;
    npcop<=0;aluctrl<=0;extop<=0;
    memtoreg<=0;temp<=0;
end


assign multctrl=(func==`mult_func&op==`special)?1:
              (func==`multu_func&op==`special)?2:
              (func==`div_func&op==`special)?3:
              (func==`divu_func&op==`special)?4:
               0;
					
assign dmop=(op==`lbu)?1:
            (op==`lb) ?2:
            (op==`lhu)?3:
            (op==`lh) ?4:
            0;
				
assign ismtc0=(op==`mftc0&rs==`mtc0_rs);
assign ismfc0=(op==`mftc0&rs==`mfc0_rs);
assign iseret=(instr==`eret);
				
assign start=(op==`special&&(func==`mult_func||func==`multu_func||func==`div_func||func==`divu_func));

assign ismu=(op==`special&&(func==`mult_func||func==`multu_func||func==`div_func||func==`divu_func||func==`mthi_func||func==`mtlo_func||func==`mfhi_func||func==`mflo_func));
		
assign muwe=(op==`special&&func==`mthi_func)?1:
            (op==`special&&func==`mtlo_func)?2:
             0;
assign mure=(op==`special&&func==`mfhi_func)?1:
            (op==`special&&func==`mflo_func)?2:
             0;		
				 
always@(*)begin
      if(op==`special)
         begin
             if(func==`addu_func||func==`add_func)
               begin
					 temp<=1;
                    regwrite<=1; memwrite<=0; 
                    alusrc<=0; npc<=0; regdst<=`regdst_rd;
                    npcop<=0;aluctrl<=`alu_add;extop<=`ext_zero;
                    memtoreg<=`mtr_alu;   
               end
             else if(func==`subu_func||func==`sub_func)
               begin
					  temp<=2;
                    regwrite<=1; memwrite<=0; 
                    alusrc<=0; npc<=0; regdst<=`regdst_rd;
                    npcop<=0;aluctrl<=`alu_sub;extop<=`ext_zero;
                    memtoreg<=`mtr_alu;                    
               end
             else if(func==`jr_func)
               begin
					  temp<=3;
                    regwrite<=0; memwrite<=0; 
                    alusrc<=0; npc<=1; regdst<=0;
                    npcop<=`npc_jr;aluctrl<=0;extop<=0;
                    memtoreg<=0;                    
               end
				 else if(func==`jalr_func)    
					begin
					  temp<=4;
						  regwrite<=1; memwrite<=0; 
						  alusrc<=0; npc<=1; regdst<=`regdst_rd;
						  npcop<=`npc_jr;aluctrl<=0;extop<=0;
						  memtoreg<=`mtr_pc8; 
					end
				 else if(func==`and_func||func==`or_func||func==`xor_func||func==`nor_func)
				 begin
				     temp<=5;
						  regwrite<=1; memwrite<=0; 
						  alusrc<=0; npc<=0; regdst<=`regdst_rd;
						  npcop<=0;extop<=0;
						  memtoreg<=`mtr_alu; 
						  if(func==`and_func)
						       aluctrl<=`alu_and;
						  else if(func==`or_func)
						       aluctrl<=`alu_or;
						  else if(func==`xor_func)
						       aluctrl<=`alu_xor;
						  else if(func==`nor_func)
						       aluctrl<=`alu_nor;
               end	
             else if(func==`slt_func||func==`sltu_func)
               begin
                 temp<=6;
						  regwrite<=1; memwrite<=0; 
						  alusrc<=0; npc<=0; regdst<=`regdst_rd;
						  npcop<=0;extop<=0;
						  memtoreg<=`mtr_alu; 
                    if(func==`slt_func)
                       aluctrl<=`alu_slt;
                    else
                       aluctrl<=`alu_sltu;						  
               end		
             else if(func==`sll_func||func==`srl_func||func==`sra_func||func==`sllu_func||func==`srlu_func||func==`srau_func)
               begin
                 temp<=7;
						  regwrite<=1; memwrite<=0; 
						  alusrc<=0; npc<=0; regdst<=`regdst_rd;
						  npcop<=0;extop<=0;
						  memtoreg<=`mtr_alu; 
                    if(func==`sll_func)
                       aluctrl<=`alu_sll;
                    else if(func==`srl_func)
                       aluctrl<=`alu_srl;
                    else if(func==`sra_func)
                       aluctrl<=`alu_sra;
                    else if(func==`sllu_func)
                       aluctrl<=`alu_sllu;
                    else if(func==`srlu_func)
                       aluctrl<=`alu_srlu;
                    else if(func==`srau_func)
                       aluctrl<=`alu_srau;						  
               end	
             else if(func==`mthi_func||func==`mtlo_func)
               begin
                 temp<=8;		
						  regwrite<=0; memwrite<=0; 
						  alusrc<=0; npc<=0; regdst<=0;
						  npcop<=0;extop<=0;
						  memtoreg<=`mtr_alu; 
                    aluctrl<=0;	
					end
             else if(func==`mfhi_func||func==`mflo_func)
               begin
                 temp<=9;		
						  regwrite<=1; memwrite<=0; 
						  alusrc<=0; npc<=0; regdst<=`regdst_rd;
						  npcop<=0;extop<=0;
						  memtoreg<=`mtr_alu; 
                    aluctrl<=0;
					end
             else if(func==`mult_func||func==`multu_func||func==`div_func||func==`divu_func)
               begin
                 temp<=10;		
						  regwrite<=0; memwrite<=0; 
						  alusrc<=0; npc<=0; regdst<=`regdst_rd;
						  npcop<=0;extop<=0;
						  memtoreg<=0; 
                    aluctrl<=0;		
               end						  
             else 
               begin
                    regwrite<=0; memwrite<=0; 
                    alusrc<=0; npc<=0; regdst<=0;
                    npcop<=0;aluctrl<=0;extop<=0;
                    memtoreg<=0;                     
               end
         end
    else if(op==`ori||op==`andi||op==`xori)
         begin
			    temp<=11;
                    regwrite<=1; memwrite<=0; 
                    alusrc<=1; npc<=0; regdst<=`regdst_rt;
                    npcop<=0;extop<=`ext_zero;
                    memtoreg<=`mtr_alu;  
						  if(op==`ori)
						       aluctrl<=`alu_or;
						  else if(op==`andi)
						       aluctrl<=`alu_and;
						  else if(op==`xori)
						       aluctrl<=`alu_xor;          						  
         end
    else if(op==`addi||op==`addiu)
         begin
			   temp<=12;
                    regwrite<=1; memwrite<=0; 
                    alusrc<=1; npc<=0; regdst<=`regdst_rt;
                    npcop<=0;aluctrl<=`alu_add;extop<=`ext_sign;
                    memtoreg<=`mtr_alu;               
         end
    else if(op==`sw||op==`sb||op==`sh)
         begin
			   temp<=13;
                    regwrite<=0; memwrite<=1; 
                    alusrc<=1; npc<=0; regdst<=0;
                    npcop<=0;aluctrl<=`alu_add;extop<=`ext_sign;
                    memtoreg<=0;              
         end
    else if(op==`lw||op==`lb||op==`lbu||op==`lh||op==`lhu) 
         begin
			    temp<=14;
                    regwrite<=1; memwrite<=0; 
                    alusrc<=1; npc<=0; regdst<=`regdst_rt;
                    npcop<=0;aluctrl<=`alu_add;extop<=`ext_sign;
                    memtoreg<=`mtr_dm;              
         end
    else if(op==`lui)
         begin
			   temp<=15;
                    regwrite<=1; memwrite<=0; 
                    alusrc<=1; npc<=0; regdst<=`regdst_rt;
                    npcop<=0;aluctrl<=`alu_add;extop<=`ext_lui;
                    memtoreg<=`mtr_alu; 
         end
    else if(op==`jal)
         begin
			   temp<=16;
                    regwrite<=1; memwrite<=0; 
                    alusrc<=0; npc<=1; regdst<=`regdst_j31;
                    npcop<=`npc_jal;aluctrl<=0;extop<=0;
                    memtoreg<=`mtr_pc8; 
         end
	 else if(op==`j)    
     	   begin
			   temp<=17;
                    regwrite<=0; memwrite<=0; 
                    alusrc<=0; npc<=1; regdst<=0;
                    npcop<=`npc_jal;aluctrl<=0;extop<=0;
                    memtoreg<=0; 
         end
	 else if(op==`beq||op==`bgtz||op==`blez||op==`bne||op==`bgezbltz)
         begin
			   temp<=18;
                    regwrite<=0; memwrite<=0; 
                    alusrc<=0; npc<=1; regdst<=0;
                    npcop<=`npc_beq;aluctrl<=0;extop<=`ext_sign;
                    memtoreg<=0; 
			end
	 else if(op==`slti||op==`sltiu)
	      begin
			   temp<=19;
                    regwrite<=1; memwrite<=0; 
                    alusrc<=1; npc<=0; regdst<=`regdst_rt;
                    npcop<=0;extop<=`ext_sign;
                    memtoreg<=`mtr_alu;
						  if(op==`slti)
						   aluctrl<=`alu_slt;
						  else
						   aluctrl<=`alu_sltu;
         end
	else if(instr==`eret)
			begin
			   temp<=20;
						  regwrite<=0; memwrite<=0; 
                    alusrc<=0; npc<=1; regdst<=0;
                    npcop<=`npc_epc;aluctrl<=0;extop<=0;
                    memtoreg<=0; 
         end
	else if(op==`mftc0&rs==`mfc0_rs)
			begin
			   temp<=21;
						  regwrite<=1; memwrite<=0; 
                    alusrc<=0; npc<=0; regdst<=`regdst_rt;
                    npcop<=0;aluctrl<=0;extop<=0;
                    memtoreg<=`mtr_dm; 
         end 
	else if(op==`mftc0&rs==`mtc0_rs)
			begin
			   temp<=22;
						  regwrite<=0; memwrite<=0; 
                    alusrc<=0; npc<=0; regdst<=0;
                    npcop<=0;aluctrl<=0;extop<=0;
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
   
endmodule
