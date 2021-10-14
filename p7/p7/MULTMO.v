`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:13:45 12/22/2020 
// Design Name: 
// Module Name:    multmo 
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
module MULTMO(clk,reset,D1,D2,multctrl,busy,start,hi,lo,we);
input clk,reset,start;
input [1:0] we;
input [31:0] D1,D2;
input [2:0] multctrl;
output reg busy;
output reg [31:0] hi,lo;

reg state;
reg [4:0] count;
reg [31:0] hite,lote;

	initial begin
	busy<=0;state<=0;hi<=0;lo<=0;
	count<=0;hite<=0;lote<=0;
	end
	
	always@(negedge clk)begin
	if(start&&state==0)begin
	 
	  state<=1;
	  
	  if(multctrl==1)begin
	   {hite,lote}<=$signed(D1)*$signed(D2);
		count<=5;
	   end
     else if(multctrl==2)begin
      {hite,lote}<=$unsigned(D1)*$unsigned(D2);
		count<=5;
		end    
		else if(multctrl==3)begin
	   hite<=$signed(D1) % $signed(D2);
	   lote<=$signed(D1) / $signed(D2);
	count<=10;
		end    
		else if(multctrl==4)begin
    lote<=$unsigned(D1)/$unsigned(D2);
	 hite<=$unsigned(D1)%$unsigned(D2);
		count<=10;
		end
		else
		;
   end   		
	end
	
  always@(posedge clk)begin
  if(reset)begin
   busy<=0;
	state<=0;
	hi<=0;lo<=0;
	count<=0;
	hite<=0;lote<=0;
	end
	
	else begin
	if(state==1&&busy==0)begin
	 busy<=1;
	 count<=count-1;
	 end
	else if(busy==1&count!=0)begin
	  count<=count-1;
	  end
	else if(busy==1&count==0)begin
	  hi<=hite;
	  lo<=lote;
	  busy<=0;
	  state<=0;
	  end
	else if(busy==0&we==1)begin
	hi<=D1;
	end
	else if(busy==0&we==2)begin
	lo<=D1;
	end
	else
	
	  ;
	  
	end
	end
	

endmodule
