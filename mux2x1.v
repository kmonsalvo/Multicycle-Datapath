`timescale 1ns / 1ps

module mux2x1(
    input A,
    input B,
    input OP,
    output R
    );

	wire NOP;
	wire A1, A2;
	
	not(NOP, OP);
	
	and X0(A1, NOP, A);
	and X1(A2, OP, B);
	
	or(R, A1, A2); 
	
endmodule
