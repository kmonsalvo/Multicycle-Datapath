`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: California State University of Los Angeles
// Engineer: 
// 
// Create Date:    13:29:41 11/13/2017 
// Design Name: 	 
// Module Name:    RegFile 
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
module regfile(ra1, ra2, wa, wd, RegWrite, clk, rd1, rd2);
    input [2:0] ra1;
    input [2:0] ra2;
    input [2:0] wa;
    input [15:0] wd;
    input RegWrite; 
	 input clk;
    output reg [15:0] rd1;
    output reg [15:0] rd2;
	 
	 //Define the Registers
	 reg [15:0] regs [0:7]; //8 registers. Each register can hold 16 bits of data
	 
	 //Always block handling input ra1 (Verilog cannot only handle output reg per always block
	 always @ (posedge clk) begin
				if (ra1 == 3'b000) begin  //Register zero is always zero
					rd1 = 16'h0; 
				end else begin
					rd1 = regs[ra1]; 
				end
		end	
	//Always bloack handling input ra2
	 always @ (posedge clk) begin
				if (ra2 == 3'b000) begin
					rd2 = 16'h0;
				end else begin
					rd2 = regs[ra2];
				end
		end
		
		/*Always block handling the data*/  //NegEdge Clock?
	always @(posedge clk) begin
		if (RegWrite == 1'b1)
			if (wa!= 2'h0) begin
				regs[wa] = wd;
			end
	end
endmodule
