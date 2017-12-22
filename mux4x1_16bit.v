`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:56:18 12/09/2017 
// Design Name: 
// Module Name:    mux4x1_16bit 
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
module mux4x1_16bit(in0, in1, in2, in3, sel, out);
	input [15:0] in0;
	input [15:0] in1;
	input [15:0] in2;
	input [15:0] in3;
	input [1:0] sel;
	output [15:0] out;


	assign out = (sel==0) ? in0: (sel==1) ? in1: (sel==2) ? in2: in3;

endmodule 
