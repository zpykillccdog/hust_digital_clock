`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:24:02 03/31/2022 
// Design Name: 
// Module Name:    Time_count 
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
module time_count(clk, s0, s1, m0, m1, h0, h1);
	input clk;
	output[3:0] s0, s1, m0, m1, h0, h1;
	reg[16:0] count;
	
	//计时模块,每24*60*60秒为一轮
	initial count = 0;
	always@(posedge clk)
		begin
			if(count != 17'd86399)
				count <= count + 1;
			else count <= 0;
		end
	
	//当前小时、分钟、秒的计算模块
	reg[3:0] s0, s1, m0, m1, h0, h1;//分别对应秒、分、时的个位、十位
	initial 
		begin
			s0 = 0; s1 = 0; m0 = 0; m1 = 0; h0 = 0; h1 = 0;
		end
	always@(count)
		begin
			s0 <= (count%60)%10;
			s1 <= (count%60-((count%60)%10))/10;
			m0 <= (((count-count%60)/60)%60)%10;
			m1 <= ((((count-count%60)/60)-((count-count%60)/60)%10)%60)/10;
			h0 <= ((count-count%3600)/3600)%10;
			h1 <= (((count-count%3600)/3600)-((count-count%3600)/3600)%10)/10;
		end
endmodule 