`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:14:59 12/10/2017
// Design Name:   connection1
// Module Name:   C:/Users/Kevin/Desktop/mips32/bench/bench/connection1_tb3.v
// Project Name:  bench
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: connection1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module connection1_tb3;

	// Inputs
	reg nrst;

	// Outputs
	wire [15:0] a;
	wire [15:0] b;
	wire [15:0] c;
	wire [15:0] d;
	wire [15:0] e;
	wire [15:0] f;
	wire [15:0] g;  
	wire [15:0] h;
	wire [15:0] i;
	wire [15:0] j;
	wire [2:0] k; 
	wire cl; 
	wire mux;
	wire [3:0] CS;
	wire [1:0]PCSIG;
	wire PCWRITE;
	wire ID;
	wire LOAD;
	wire INSTWR;
	wire [15:0] DD;
	wire [15:0] EE;
	wire [15:0] SRCA;
	wire [15:0] SRCB;

	// Instantiate the Unit Under Test (UUT)
	connection1 uut (
		.nrst(nrst), 
		.a(a), 
		.b(b),  
		.c(c), 
		.d(d), 
		.e(e), 
		.f(f), 
		.g(g), 
		.h(h), 
		.i(i), 
		.j(j),
		.k(k),
		.cl(cl),
		.mux(mux),
		.CS(CS),
		.PCSIG(PCSIG), 
		.PCWRITE(PCWRITE), 
		.ID(ID), 
		.LOAD(LOAD), 
		.INSTWR(INSTWR), 
		.DD(DD), 
		.EE(EE),
		.SRCA(SRCA),
		.SRCB(SRCB)
	); 

	initial begin
		// Initialize Inputs
		nrst = 1'b0;
		#10
		nrst = 1'b1;
		#1000
		nrst = 1'b0;
		#10
		nrst = 1'b1;
		#1000
		nrst = 1'b0;
		#10
		nrst = 1'b1;
	end
      
endmodule

