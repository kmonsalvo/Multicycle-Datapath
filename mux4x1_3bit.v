`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:41:07 12/09/2017 
// Design Name: 
// Module Name:    mux4_3bit 
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
module mux4x1_3bit(in0, in1, in2, in3, sel, out);
	input [2:0] in0;
	input [2:0] in1;
	input [2:0] in2;
	input [2:0] in3;
	input [1:0] sel;
	output reg [2:0] out;
	
	always @ (*) begin
		case(sel)
			2'b00: begin
				out <= in0;
			end
			2'b01: begin
				out <= in1;
			end
			2'b10: begin
				out <= in2;
			end
			2'b11: begin
				out <= in3;
			end
		endcase
	end
endmodule
