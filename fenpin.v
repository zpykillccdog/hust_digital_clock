`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:51:31 03/31/2022 
// Design Name: 
// Module Name:    fenpin 
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
//分频得到1khz和1hz
module frequency_divider(clk_1hz, clk_1khz, clk_100M);
	input clk_100M;
	output clk_1hz, clk_1khz;
	reg[16:0] count1;
	reg[9:0] count2;
	reg clk_1khz, clk_1hz;
	//变量说明：
	//输入clk_100M为100M的时钟信号
	//count1和count2是分频器计的数变量，clk_1khz和clk_1hz是分频器的输出
	//中间变量必须在源程序中初始化
	initial 
		begin
			count1 = 0;
			count2 = 0;
			clk_1khz = 0;
			clk_1hz = 0;
		end

	//100M 100000分频得到1khz
	always@(posedge clk_100M)
		begin
			if(count1 == 17'd49999)
				begin
					clk_1khz <= ~clk_1khz;
					count1 <= 0;
				end
			else count1 <= count1 + 1;
		end
	
	//1khz 1000分频得到1hz
	always@(posedge clk_1khz)
		begin
			if(count2 == 10'd499)
				begin
					clk_1hz <= ~clk_1hz;
					count2 <= 0;
				end
			else count2 <= count2 + 1;
		end
endmodule 
