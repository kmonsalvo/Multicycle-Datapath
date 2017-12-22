`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:54:17 10/12/2017 
// Design Name: 
// Module Name:    ALU_3BIT 
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
module ALU_16BIT(A, B, OP, ZERO, Result);
    input [15:0] A;
    input [15:0] B;
    input [3:0] OP;
    output ZERO;
    output [15:0] Result;
	 
		wire COUT0, COUT1, COUT2;
		wire COUT3, COUT4, COUT5; 
		wire COUT6, COUT7, COUT8; 
		wire COUT9, COUT10, COUT11; 
		wire COUT12, COUT13, COUT14, COUT15; 
		wire R0, R1, R2;
		wire R3, R4, R5; 
		wire R6, R7, R8; 
		wire R9, R10, R11; 
		wire R12, R13, R14;
		wire R15; 
		
		wire setv;
		wire V;
		wire SET; 
		wire msb;
		wire slt;  
		
		and (slt, OP[1], OP[0]); 
		
		mux2x1 M1(setv, R15, OP[3], SET);
		mux2x1 M2(R15,1'b0,slt,msb); 	
			
		assign Result = {msb,R14,R13,R12,R11,R10,R9,R8,R7,R6,R5,R4,R3,R2,R1,R0};
		
		alu_lsb_first A0(R0, COUT0, A[0], B[0], OP[2], OP, SET);
		alu_lsb A1(R1, COUT1, A[1], B[1], COUT0, OP);
		
		alu_lsb A2(R2, COUT2, A[2], B[2], COUT1, OP);
		alu_lsb A3(R3, COUT3, A[3], B[3], COUT2, OP);
		alu_lsb A4(R4, COUT4, A[4], B[4], COUT3, OP);
		alu_lsb A5(R5, COUT5, A[5], B[5], COUT4, OP);
		alu_lsb A6(R6, COUT6, A[6], B[6], COUT5, OP);
		alu_lsb A7(R7, COUT7, A[7], B[7], COUT6, OP);
		alu_lsb A8(R8, COUT8, A[8], B[8], COUT7, OP);
		alu_lsb A9(R9, COUT9, A[9], B[9], COUT8, OP);
		alu_lsb A10(R10, COUT10, A[10], B[10], COUT9, OP);
		alu_lsb A11(R11, COUT11, A[11], B[11], COUT10, OP);
		alu_lsb A12(R12, COUT12, A[12], B[12], COUT11, OP);
		alu_lsb A13(R13, COUT13, A[13], B[13], COUT12, OP);
		alu_lsb A14(R14, COUT14, A[14], B[14], COUT13, OP);
		
		alu_msb A15(R15, COUT15, V, setv, A[15], B[15], COUT14, OP);
		//alu_msb (R, COUT, V, SETV, A, B, CIN, OP);

		//alu_lsb  A0(R0, COUT0, A[0], B[0], CIN, R2, OP);
		//alu_lsb  A1(R1, COUT1, A[1], B[1], COUT0, R2, OP);
		//alu_msb	A2(A[2], B[2], COUT1, OP, R2, COUT2, V, SETV);
		//alu_msb A2(R2, COUT15, V, setv, A[2], B[2], COUT15, OP);
		
		nor(ZERO, R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15); 
endmodule
