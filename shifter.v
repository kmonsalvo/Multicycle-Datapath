`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:17:10 12/09/2017 
// Design Name: 
// Module Name:    shifter 
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
module shifter(rt, imm, control, shiftresult);	
	input [15:0] rt;
	input [4:0] imm;
	input control;
	output reg [15:0] shiftresult;
	
	always @(*) begin
		if (control) begin
			shiftresult <= (rt << (imm));
		end else begin
			shiftresult <= (rt >> (imm));
		end
	end
endmodule
