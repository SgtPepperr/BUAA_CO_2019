`timescale 1ns / 1ps
`define exccode cause[6:2]
`define ip cause[15:10]
`define bd cause[31]
`define ie sr[0]
`define exl sr[1]
`define im  sr[15:10]
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:35:17 12/30/2020 
// Design Name: 
// Module Name:    cp0 
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

module CP0(clk,reset,exccode0,din_cp0,dout_cp0,a1,a2,MacroPC,bd_cp0,we,hwint,epc_cp0,exlclr,exlset,intreq);

input [5:0] hwint,exccode0;
input clk,reset,bd_cp0,we;
input exlclr,exlset;
input [4:0] a1,a2;
input [31:0] din_cp0,MacroPC;
output [31:0] epc_cp0;
output intreq;
output [31:0] dout_cp0;
reg [31:0] epc,cause,sr,prid;
wire hwexcp;
wire [31:0] pcnew;
assign dout_cp0=(a1==12)?sr:
              (a1==13)?cause:
              (a1==14)?epc:
              (a1==15)?prid:
              32'h20001119;


assign hwexcp=~`exl&`ie&((`im&hwint)!=0);
assign epc_cp0=epc;
assign intreq=hwexcp|(exccode0!=0&~`exl);

initial begin
     `im<=6'b111111;
    prid<=32'h20011119;
    `ie<=1;
    `exl<=0;
    epc<=0;
    cause<=0;
 
end


assign pcnew={MacroPC[31:2],2'b00};

always@(posedge clk)begin
  if(reset)begin
    `im<=6'b111111;
    prid<=32'h20011119;
    `ie<=1;
    `exl<=0;
    epc<=0;
    cause<=0;
  end
  else if(hwexcp)begin
    epc<=(bd_cp0==1)?pcnew-4:pcnew;
    `exl<=1;
    `ip<=hwint;
    `exccode<=0;
    `bd<=bd_cp0;
  end
  else if(exccode0!=0&~`exl)begin
    `exccode<=exccode0;
    epc<=(bd_cp0==1)?pcnew-4:pcnew;
    `bd<=bd_cp0;
    `exl<=1;
    `ip<=hwint;
  end
  else if(exlclr)begin
    `exl<=0;
    `ip<=hwint;
  end
  else if(exlset)begin
    `exl<=1;
    `ip<=hwint;
  end
  else if(we)begin
    `ip<=hwint;
    if(a2==12)
      sr<=din_cp0;
  //  else if(a2==13)
  //   cause<=din_cp0;
    else if(a2==14)
      epc<=din_cp0;
    else if(a2==15)
      prid<=din_cp0;
  end
  else
    `ip<=hwint;

end

endmodule

