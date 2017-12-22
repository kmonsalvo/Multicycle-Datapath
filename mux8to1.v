`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:03:35 11/28/2017 
// Design Name: 
// Module Name:    mux8to1 
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
module mux8to1(in0, in1, in2, in3, in4, in5, in6, in7, sel, out);
    input [15:0] in0;
    input [15:0] in1;
    input [15:0] in2;
    input [15:0] in3;
    input [15:0] in4;
    input [15:0] in5;
    input [15:0] in6;
    input [15:0] in7;
    input [2:0] sel;
    output [15:0] out;

assign out = (sel == 0) ? in0 :(sel == 1) ? in1 :(sel == 2) ? in2 :(sel == 3) ? in3 :(sel == 4) ? in4 :(sel == 5) ? in5 :(sel == 6) ? in6 :in7;

endmodule

