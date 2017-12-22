`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:16:59 11/25/2017 
// Design Name: 
// Module Name:    zeroext 
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
module zeroext(imm, zeroext);
	input  [4:0] imm;
	output [15:0] zeroext;
	
	assign zeroext = {11'b00000000000, imm};
	
endmodule
