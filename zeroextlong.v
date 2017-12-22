`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:16:05 11/21/2017 
// Design Name: 
// Module Name:    zeroextlong 
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
module zeroextlong(imm, zero_imm);
	input  [7:0] imm;
	output [15:0] zero_imm;

	assign zero_imm = {8'b00000000, imm};
	
endmodule
