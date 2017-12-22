`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:37:15 11/14/2017 
// Design Name: 
// Module Name:    sign_ext 
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
module signext(imm, sign_imm);
	input  [4:0] imm;
	output reg [15:0] sign_imm;
	
	always @ (imm) begin
		if (imm[4] == 1'b1) begin
			sign_imm = {11'b11111111111, imm};
		end else begin
			sign_imm = {11'b00000000000, imm};
		end
	end
	
	

endmodule 