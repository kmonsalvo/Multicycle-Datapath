`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:39:44 11/14/2017 
// Design Name: 
// Module Name:    inst_mem 
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
module memory(addr, data, MemWrite, MemRead, clk, inst_out);	
	input [15:0] addr;
	input [15:0] data;
	input MemWrite;
	input MemRead;
	input clk;
	output reg [15:0] inst_out;

	reg [15:0] Memory [0:255];
	
	assign waddr = addr << 1;
	initial begin
		$readmemb("instructions.txt", Memory);
		$monitor("mem[0] = &b mem[1] =%b", Memory[addr], Memory[1]);
	end

	always @ (posedge clk) begin
		if (MemWrite) begin  //how do we write to Memory?
			Memory [addr] <= data;
		end 
		else if (MemRead) begin //reading from Memory
			inst_out <= Memory [addr];
		end 
	end 
endmodule 
