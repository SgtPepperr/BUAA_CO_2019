`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:17:16 11/18/2020 
// Design Name: 
// Module Name:    ALU 
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
module ALU(a,b,aluctrl,instr_e,ao);
 input [31:0] a,b,instr_e;
 input [3:0]  aluctrl;
 output [31:0] ao;

 wire [31:0] out1[16:0];
 wire [4:0] s;
 assign s=instr_e[10:6];

 assign out1[0]=a+b;
 assign out1[1]=a-b;
 assign out1[2]=a|b;
 assign out1[3]=a&b;
 assign out1[4]=a^b;
 assign out1[5]=~(a|b);
 assign out1[6]=$unsigned(b)<<$unsigned(s);
 assign out1[7]=$unsigned(b)>>$unsigned(s);
 assign out1[8]=$signed(b)>>>$unsigned(s);
 assign out1[9]=$unsigned(b)<<$unsigned(a[4:0]);
 assign out1[10]=$unsigned(b)>>$unsigned(a[4:0]);
 assign out1[11]=$signed(b)>>>$unsigned(a[4:0]);
 assign out1[12]=($signed(a)<$signed(b))?32'b1:32'b0;
 assign out1[13]=($unsigned(a)<$unsigned(b))?32'b1:32'b0;
 

 assign ao=out1[aluctrl];
 
endmodule
