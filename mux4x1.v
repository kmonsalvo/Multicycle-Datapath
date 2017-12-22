`timescale 1ns / 1ps

module mux4x1(
    output reg R,
    input R1,
    input R2,
    input R3,
    input R4,
    input [1:0] OP
    );
	 
	 always @ (*) begin
		case (OP)
			2'b00: R = R1;
			2'b01: R = R2;
			2'b10: R = R3;
			2'b11: R = R4;
		endcase
	 end
endmodule
