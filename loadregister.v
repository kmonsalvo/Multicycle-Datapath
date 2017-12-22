`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:52:27 11/30/2017 
// Design Name: 
// Module Name:    loadregister 
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
module loadregister(inst, pcplus, pcwrite, IRwrite, clk, pc, OP, RS, RT, RD, FUNCT, IMM, LONG_IMM, ADDRESS);
	input [15:0] inst;
	input [15:0] pcplus;
	input pcwrite;
	input IRwrite;
	input clk;
	output reg [15:0] pc;
	output reg [4:0] OP;
	output reg [2:0] RS;
	output reg [2:0] RT;
	output reg [2:0] RD;
	output reg [1:0] FUNCT;
	output reg [4:0] IMM;
	output reg [7:0] LONG_IMM; 
	output reg [10:0] ADDRESS;
	
	
	reg [4:0] OP_reg;
	reg [2:0] RS_reg;
	reg [2:0] RT_reg;
	reg [2:0] RD_reg;
	reg [1:0] FUNCT_reg;
	reg [4:0] IMM_reg;
	reg [7:0] LONG_IMM_reg; 
	reg [10:0] ADDRESS_reg;
	
	
	
	initial begin 
		FUNCT <= 2'd0;
		pc <= 16'd0;
	end
	
	always @ (posedge clk) begin  
		//Intruction Register 
		OP_reg <= inst [15:11];
		RS_reg <= inst [10:8];
		RT_reg <= inst [7:5];
		RD_reg <= inst [4:2];
		FUNCT_reg <= inst [1:0];
		IMM_reg <= inst [4:0] ;
		LONG_IMM_reg <= inst [7:0];
		ADDRESS_reg <= inst [10:0];
	end
	
	always @ (IRwrite) begin
		OP <= OP_reg; 
		RS <= RS_reg;  
		RT <= RT_reg;
		RD <= RD_reg; 
		FUNCT <= FUNCT_reg; 
		IMM <= IMM_reg;
		LONG_IMM <= LONG_IMM_reg; 
		ADDRESS <= ADDRESS_reg;
	end
	
	always @ (pcwrite) begin
	     pc <= pcplus;
	end
endmodule
