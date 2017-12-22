`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:30:26 11/28/2017 
// Design Name: 
// Module Name:    clock 
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
module clock(clk);
	output reg clk;
	
	initial 
	clk = 0;
	
	always 
		#1 clk = ~clk;

endmodule
