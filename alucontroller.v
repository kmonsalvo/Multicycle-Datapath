`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:21:08 11/25/2017 
// Design Name: 
// Module Name:    alucontroller 
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
module alucontroller(aluop, funct, clk, op);
	input [2:0] aluop;
	input [1:0] funct;
	input clk; 
	output reg [3:0] op;
	
	always @(clk) begin
    case(aluop)
        3'b000: 
            case(funct)
                2'b00: 
                    op = 4'b0000;   //add 
                2'b01: 
                    op = 4'b0100;   //subtact
                2'b10: 
                    op = 4'b0000;   //add
                2'b11: 
                    op = 4'b0100;  //sub
            endcase
         3'b001: 
            case(funct)
                2'b00: 
                    op = 4'b0001;   //and 
                2'b01: 
                    op = 4'b0010;   //or
                2'b10: 
                    op = 4'b1111;   //slt
                2'b11: 
                    op = 4'b1111;  //slt
             endcase
           3'b010:
               op = 4'b0000;     //add
           3'b011: 
               op = 4'b0100;     //subtract
           3'b100: 
                op = 4'b0010;    //or
           3'b101: 
                op = 4'b0001;    //and 
           3'b110: 
                op = 4'b1111;  //slt
    endcase

end 

endmodule
