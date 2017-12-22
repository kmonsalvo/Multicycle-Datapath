`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:33:39 12/09/2017 
// Design Name: 
// Module Name:    mux2x1_16bit 
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
module mux2x1_16bit(A, B, OP, R);
    input [15:0] A;
    input [15:0] B;
    input OP;
    output [15:0] R;

	 assign R = OP ? B:A;
	 
endmodule
