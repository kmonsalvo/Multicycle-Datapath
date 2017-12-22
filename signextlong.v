`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:02:55 11/20/2017 
// Design Name: 
// Module Name:    sign_ext_long 
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
module signextlong(imm, sign_imm);
	input  [7:0] imm;
	output [15:0] sign_imm;
	
	wire [15:0] sign;

	assign sign = {8'b11111111, imm};
	
	assign sign_imm = sign;
	
endmodule
	
