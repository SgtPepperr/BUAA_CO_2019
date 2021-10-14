`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:21:13 12/30/2020 
// Design Name: 
// Module Name:    E_EXC 
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

module E_EXC(instr_e,overflow,exccode_el,exccode_er
    );
  input [31:0] instr_e;
  input overflow;
  input [5:0] exccode_el;
  output [5:0] exccode_er;
   
  wire [5:0] op,func;

  assign op=instr_e[31:26];
  assign func=instr_e[5:0];  

  assign exccode_er=((op==`special&(func==`add_func|func==`sub_func))|(op==`addi))&overflow?`exc_Ov:
                    (op==`lw|op==`lh|op==`lhu|op==`lb|op==`lbu)&overflow?`exc_Adel:
						  (op==`sw|op==`sh|op==`sb)&overflow?`exc_Ades:
						  exccode_el;


endmodule
