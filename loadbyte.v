`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:49:44 12/09/2017 
// Design Name: 
// Module Name:    loadbyte 
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
module loadbyte(databyte, data);
	input [7:0] databyte;
	output [15:0] data;
	
	assign data = {8'b00000000,databyte};
	
endmodule
