`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:15:09 12/05/2017 
// Design Name: 
// Module Name:    shiftone 
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
module shiftone(signextimm, extshift);
	input [15:0] signextimm;
	output [15:0] extshift;
	
	assign extshift = (signextimm << 1);

endmodule
