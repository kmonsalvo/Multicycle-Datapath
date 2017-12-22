`timescale 1ns / 1ps

module fulladder(
    input A,
    input B,
    input CIN,
    output R,
	 output COUT
    );
	 
		wire R1, R2, R3; //used for the output of logical gates
		wire A0, A1, A2;
		wire OR1;
	 
		xor X0(R1, A, B);
		xor X1(R, R1, CIN);
	 
		and X2(A0, B, CIN);
		and X3(A1, A, CIN);
		and X4(A2, A, B);
		
		or X5(OR1, A0, A1);
		or X6(COUT, OR1, A2);

endmodule
