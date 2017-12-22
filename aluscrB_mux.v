`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:36:22 11/27/2017 
// Design Name: 
// Module Name:    aluscrB_mux 
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
module aluscrB_mux(
    input [2:0] sel,
    output reg[15:0] out,
    input [15:0] B,
    input [1:0] pcplus2,
    input [15:0] signext,
    input [15:0] zeroext,
    input [15:0] signextshiftlong,
    input [15:0] signextlong,
    input [15:0] zeroextlong,
    input [15:0] zero
	 );
	 
	 always@(sel or B or pcplus2 or signext or zeroext or signextshiftlong or signextlong or zeroextlong or zero)
	 begin
	  case(sel)
	   3'h0 : out = B;
	   3'h1 : out = pcplus2;
	   3'h2 : out = signext;
	   3'h3 : out = zeroext;
	   3'h4 : out = signextshiftlong;
	   3'h5 : out = signextlong;
	   3'h6 : out = zeroextlong;
	   3'h7 : out = zero;
		endcase
	 end

endmodule
