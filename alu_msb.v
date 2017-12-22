`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CAlifornia State University of Los Angeles
// Engineer: Kevin Monsalvo
// 
// Create Date:    13:46:50 10/12/2017 
// Design Name: 1 Bit ALU for the Most Significant Bit 
// Module Name:    alu_msb 
// Project Name: 16 Bit Mips
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
module alu_msb (R, COUT, V, SETV, A, B, CIN, OP);
	output R, COUT, V, SETV;
	input A, B, CIN; 
	input [3:0] OP;
	
	wire R1, R2, R3;
	wire NA, NB; //used for not gate
	wire RA, RB; //used for the result of the mux

	//not N1(NA, A);
	not N2(NB, B);
	
	//mux2x1 M1(A, NA, OP[2], RA);
	mux2x1 M2(B, NB, OP[2], RB);
	
	and (R2, A, B); 
	or (R3, A, B);

	fulladder F1(A, RB, CIN, R1, COUT);
	
	mux4x1 M3(R, R1, R2, R3, R1, OP[1:0]);
	
	xor X1(V,CIN, COUT);
	xor X2(SETV, V, R1); 
	
endmodule 
	
	
	
	
	
