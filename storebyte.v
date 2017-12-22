`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:42:13 12/09/2017 
// Design Name: 
// Module Name:    storebyte 
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
module storebyte(rd2, data);
	input [7:0] rd2;
	output [15:0] data;

	assign data = {8'b00000000, rd2};

endmodule
