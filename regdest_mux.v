`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:45:52 11/27/2017 
// Design Name: 
// Module Name:    regdest_mux 
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
module regdest_mux(
    input [1:0] Sel,
    output reg [3:0] wa,
    input [3:0] rt,
    input [3:0] rd,
    input [3:0] rs,
    input [3:0] reg7
    );

	 always @ (Sel or wa or rt or rd or rs or reg7)
	 begin
		case(Sel)
			2'h0 : wa = rt;
			2'h1 : wa = rd;
			2'h2 : wa = rs;
			2'h3 : wa = reg7;
		endcase
 	 end

endmodule
