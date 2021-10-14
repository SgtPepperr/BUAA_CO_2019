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
module ctrl(instr,regdst,isbeq,memtoreg,regwrite,memwrite,alusrc,extop,cpcop,cpc,aluctrl);
 input [31:0]instr;
 output reg regwrite,memwrite,alusrc,cpc;
 output reg [1:0] cpcop,aluctrl,extop,regdst;
 output reg [3:0] memtoreg;
 output wire isbeq;
 
 wire [5:0] op,func;
 //wire [4:0] rt;
 
 assign op=instr[31:26];
 assign func=instr[5:0];
 //assign rt=instr[20:16];
 
initial begin
    regwrite<=0; memwrite<=0; 
    alusrc<=0; cpc<=0; regdst<=0;
    cpcop<=0;aluctrl<=0;extop<=0;
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
                    alusrc<=0; cpc<=0; regdst<=1;
                    cpcop<=0;aluctrl<=0;extop<=0;
                    memtoreg<=1;   
               end
             else if(func==`subu_func)
               begin
                    regwrite<=1; memwrite<=0; 
                    alusrc<=0; cpc<=0; regdst<=1;
                    cpcop<=0;aluctrl<=1;extop<=0;
                    memtoreg<=1;                   
               end
             else if(func==`jr_func)
               begin
                    regwrite<=0; memwrite<=0; 
                    alusrc<=0; cpc<=1; regdst<=0;
                    cpcop<=2;aluctrl<=0;extop<=0;
                    memtoreg<=0;                    
               end
             else 
               begin
                    regwrite<=0; memwrite<=0; 
                    alusrc<=0; cpc<=0; regdst<=0;
                    cpcop<=0;aluctrl<=0;extop<=0;
                    memtoreg<=0;                     
               end
         end
    `ori:
         begin
                    regwrite<=1; memwrite<=0; 
                    alusrc<=1; cpc<=0; regdst<=0;
                    cpcop<=0;aluctrl<=2;extop<=0;
                    memtoreg<=1;              
         end
    `lui:
         begin
                    regwrite<=1; memwrite<=0; 
                    alusrc<=0; cpc<=0; regdst<=0;
                    cpcop<=0;aluctrl<=0;extop<=2;
                    memtoreg<=2;              
         end
    `lw: 
         begin
                    regwrite<=1; memwrite<=0; 
                    alusrc<=1; cpc<=0; regdst<=0;
                    cpcop<=0;aluctrl<=0;extop<=1;
                    memtoreg<=0;              
         end
    `sw: 
         begin
                    regwrite<=0; memwrite<=1; 
                    alusrc<=1; cpc<=0; regdst<=0;
                    cpcop<=0;aluctrl<=0;extop<=1;
                    memtoreg<=0;              
         end
    `beq:
         begin
                    regwrite<=0; memwrite<=0; 
                    alusrc<=0; cpc<=1; regdst<=0;
                    cpcop<=0;aluctrl<=0;extop<=1;
                    memtoreg<=0; 
         end
    `jal:
         begin
                    regwrite<=1; memwrite<=0; 
                    alusrc<=0; cpc<=1; regdst<=2;
                    cpcop<=1;aluctrl<=0;extop<=0;
                    memtoreg<=3; 
         end
    default:
         begin
                    regwrite<=0; memwrite<=0; 
                    alusrc<=0; cpc<=0; regdst<=0;
                    cpcop<=0;aluctrl<=0;extop<=0;
                    memtoreg<=0; 
         end

    endcase
end
   
endmodule
