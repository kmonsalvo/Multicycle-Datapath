`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:21:09 11/21/2017 
// Design Name: 
// Module Name:    register 
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
module register(clk, aluresult, regdata1, regdata2, ALUOUT, A, B);
	input clk;
	input [15:0] aluresult;
	input [15:0] regdata1;
	input [15:0] regdata2;
	output reg [15:0] ALUOUT;
	output reg [15:0] A;
	output reg [15:0] B;
	
	reg [15:0] ALUOUT_reg;
	reg [15:0] A_reg;
	reg [15:0] B_reg;
	//reg [15:0] MEMDATA_reg;
	
	 
	always @ (posedge clk) begin
		//ALUOUT
		ALUOUT_reg <= aluresult;
		A_reg <= regdata1;
		B_reg <= regdata2;
		//MEMDATA_reg <= memdata;
	end
	always @(posedge clk) begin
		ALUOUT <= ALUOUT_reg;
		A <= A_reg; 
		B <= B_reg;
		//MEMDATA <= MEMDATA_reg;
	end
endmodule
