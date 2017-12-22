`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:03:46 12/09/2017 
// Design Name: 
// Module Name:    lui 
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
module lui(imm, out);
	input [7:0] imm;
	output reg [15:0] out;

	always @ (*) begin
		 out <= {imm[7:0], 8'b00000000};
	end
endmodule
