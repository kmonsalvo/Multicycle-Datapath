module alu_lsb_first (R, COUT, A, B, CIN, OP, SET);
	output R, COUT;
	input A, B, CIN;
	input SET;  
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
	
	mux4x1 M3(R, R1, R2, R3, SET, OP[1:0]);
	
endmodule 
	
	
	
	
	