`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//   
// Create Date:    23:54:01 11/20/2017 
// Design Name: 
// Module Name:    controlmodule 
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
////////////////////////////////////tytfrt5g//////////////////////////////////////////////
module controlmodule(OP, nrst, clk, PCSrc, PCWrite, IorD, MemRead, MemWrite, 
	IRWrite, jr, MemtoReg, RegDst, RegWrite, ALUSrcA, ALUSrcB, ALU, BorD, beqz, bnez, jump, STATEC);
	
	input [4:0] OP;
	input clk;
	input nrst;
	output reg PCWrite;
	output reg IorD;
	output reg MemRead;
	output reg MemWrite;
	output reg IRWrite;
	output reg RegWrite;
	output reg jr;
	output reg BorD;
	output reg beqz;
	output reg bnez;
	output reg jump;
	output reg [2:0] ALU;
	output reg [2:0] MemtoReg;
	output reg [1:0] RegDst;
	output reg ALUSrcA;
	output reg [2:0] ALUSrcB;
	output reg  [1:0] PCSrc;
	output reg [3:0] STATEC;
	
parameter [3:0]
		INITIAL			=  4'd0,
		STATE0			=	4'd1,
		STATE1			= 	4'd2,
		INSTDECODE		=	4'd3,
		REXE 				=  4'd4,
		RWB 				=  4'd5,
		LOADPREP			= 	4'd6,
		LOAD				= 	4'd7,
		STORE				=	4'd8,
		IWB				=	4'd9,
		LOADBYTE1		=	4'd10,
		LOADBYTE2		=	4'd11,
		STOREBYTE		=	4'd12,
		WB_LONG			=	4'd13,
		JAL				=	4'd14;
		
		
	reg [3:0] CS; //current state
	reg [3:0] NS; //next state
	
	
	always @(posedge clk or negedge nrst) begin
		if(!nrst) begin
			CS <= INITIAL;
		end else begin
			if(CS != NS) begin
				CS <= NS;	
			end
	   end
	end
	
	always @ (CS) begin
		case(CS) 
			INITIAL: begin 
				ALUSrcA <= 1'b0;
				ALUSrcB <= 3'b001;
				ALU <= 3'b000;
				IorD <= 1'b0;
				PCSrc <= 2'b11;
				MemRead <= 1'b1;
				MemWrite <= 1'b0;
				IRWrite <= 1'b1;
				NS <= STATE1;
				STATEC <= CS;
			end
			STATE0: begin
				ALUSrcA <= 1'b0;
				ALUSrcB <= 3'b001;
				ALU <= 3'b000;
				IorD <= 1'b0;
				PCSrc <= 2'b00;
				MemRead <= 1'b1;
				MemWrite <= 1'b0;
				IRWrite <= 1'b1;
				PCWrite <= 1'b1;
				NS <= STATE1;
				STATEC <= CS; 
			end
			STATE1: begin 
				ALUSrcA <= 1'b1;
				ALUSrcB <= 3'b000;
				ALU <= 3'b000; //ADD
				IRWrite <= 1'b0;
				PCWrite <= 1'b0;
				NS <= INSTDECODE;
				STATEC <= CS;
			end
			INSTDECODE: begin
				case(OP)
					5'b00000: begin   //RType OP0
						ALU <= 3'b000; 
						ALUSrcA <= 1'b1;
						ALUSrcB <= 3'b000;
						NS <= REXE;
					end
					5'b00001: begin //RType OP1
						ALU <= 3'b001;
						ALUSrcA <= 1'b1;
						ALUSrcB <= 3'b000;
						NS <= REXE;
					end
					5'b00010: begin //JR
						PCSrc <= 2'b01;
						PCWrite <= 1'b1;
						jr <= 1'b1;
						NS <= STATE0;
					end 
					5'b00100: begin //SLL
						MemtoReg <= 3'b010;
						RegWrite <= 1'b1;
						RegDst <= 2'b01;
						NS <= STATE0;
					end 
					5'b00101: begin //SRL  //We could make it the same as SLL and have only one module shifting both ways
						MemtoReg <= 3'b001;
						RegWrite <= 1'b1;
						RegDst <= 2'b01;
						NS <= STATE0;
					end
					5'b00110: begin //LW
						ALUSrcA <= 1'b1;
						ALUSrcB <= 3'b010;
						ALU <= 3'b010;
						NS <= LOADPREP;
					end
					5'b00111: begin //SW
						ALUSrcA <= 1'b1;
						ALUSrcB <= 3'b010;
						ALU <= 3'b010;
						NS <= STORE;
					end
					5'b01000: begin //LB
						ALUSrcA <= 1'b1;
						ALUSrcB <= 3'b010;
						ALU <= 3'b010;
						NS <= LOADBYTE1;
					end
					5'b01001: begin //LBU
						ALUSrcA <= 1'b1;
						ALUSrcB <= 3'b011;
						ALU <= 3'b010;
						NS <= LOADBYTE1;
					end
					5'b01010: begin //SB
						ALUSrcA <= 1'b1;
						ALUSrcB <= 3'b010;
						ALU <= 3'b010;
						NS <= STOREBYTE;
					end
					5'b01011: begin //ADDIU
						ALUSrcA <= 1'b1;
						ALUSrcB <= 3'b011;
						ALU <= 3'b010;
						NS <= IWB;
					end
					5'b01100: begin //ADDI
						ALUSrcA <= 1'b1;
						ALUSrcB <= 3'b011;
						ALU <= 3'b010;
						NS <= IWB;
					end
					5'b01101: begin //ORI
						ALUSrcA <= 1'b1;
						ALUSrcB <= 3'b011;
						ALU <= 3'b100;
						NS <= IWB;
					end
					5'b01110: begin //ANDI
						ALUSrcA <= 1'b1;
						ALUSrcB <= 3'b011;
						ALU <= 3'b101;
						NS <= IWB;
					end
					5'b01111: begin //SLTI
						ALUSrcA <= 1'b1;
						ALUSrcB <= 3'b010;
						ALU <= 3'b110;
						NS <= IWB;
					end
					5'b10000: begin //SLTIU
						ALUSrcA <= 1'b1;
						ALUSrcB <= 3'b011;
						ALU <= 3'b101;
						NS <= IWB;
					end
					5'b10001: begin //BEQZ
						ALUSrcA <= 1'b1;
						ALUSrcB <= 3'b111;
						ALU <= 3'b011;
						PCSrc <= 2'b10;
						PCWrite <= 1'b1;
						beqz <= 1'b1;
						NS <= STATE0;
					end
					5'b10010: begin //bnez
						ALUSrcA <= 1'b1;
						ALUSrcB <= 3'b111;
						ALU <= 3'b011;
						PCSrc <= 2'b10;
						PCWrite <= 1'b1;
						bnez <= 1'b1;
						NS <= STATE0;
					end
					5'b10011: begin //LUI 
						RegDst <= 2'b10;
						RegWrite <= 1'b1;
						MemtoReg <= 3'b101;
						NS <= STATE0;
					end
					5'b10100: begin //ADDIU_Long
						ALUSrcA <= 1'b1;
						ALUSrcB <= 3'b110;
						ALU <= 3'b010;
						NS <= WB_LONG;
					end
					5'b10101: begin  //ADDI_Long
						ALUSrcA <= 1'b1;
						ALUSrcB <= 3'b101;
						ALU <= 3'b010;
						NS <= WB_LONG;
					end
					5'b10110: begin //ORI_Long
						ALUSrcA <= 1'b1;
						ALUSrcB <= 3'b110;
						ALU <= 3'b100;
						NS <= WB_LONG;
					end
					5'b10111: begin //ANDI_Long
						ALUSrcA <= 1'b1;
						ALUSrcB <= 3'b110;
						ALU <= 3'b101;
						NS <= WB_LONG;
					end
					5'b11000: begin //SLTI_Long
						ALUSrcA <= 1'b1;
						ALUSrcB <= 3'b101;
						ALU <= 3'b110;
						NS <= WB_LONG;
					end
					5'b11001: begin //SLTIU_LONG
						ALUSrcA <= 1'b1;
						ALUSrcB <= 3'b110;
						ALU <= 3'b110;
						NS <= WB_LONG;
					end
					5'b11010: begin //Jump
						jump <= 1'b1;
						PCWrite <= 1'b1;
						PCSrc <= 2'b11;
						NS <= STATE0;
					end
					5'b11011: begin //JAL
						jump <= 1'b1;
						PCWrite <= 1'b1;
						PCSrc <= 2'b11;
						NS <= JAL;
					end
				endcase
					STATEC <= CS;
			end
			REXE: begin
				NS <= RWB; //This might add delay. If necessary, delete
			end
			RWB: begin
				MemtoReg <= 3'b000;
				RegDst <= 2'b01;
				RegWrite <= 1'b1;
				NS <= STATE0;
				STATEC <= CS;
			end
			LOADPREP: begin
				IorD <= 1'b1;
				MemRead <= 1'b1;
				MemWrite <= 1'b0;
				NS <= LOAD;
				STATEC <= CS;
			end 
			LOAD: begin
				RegWrite <= 1'b1;
				MemtoReg <= 3'b011;
				RegDst <= 2'b01;
				NS <= STATE0;
				STATEC <= CS;
			end
			STORE: begin
				IorD <= 1'b1;
				MemWrite <= 1'b1;
				MemRead <= 1'b0;
				BorD <= 1'b1;
				NS <= STATE0;
				STATEC <= CS;
			end
			IWB: begin
				MemtoReg <= 3'b000;
				RegDst <= 2'b00;
				RegWrite <= 1'b1;
				NS <= STATE0;
				STATEC <= CS;
			end
			LOADBYTE1: begin
				IorD <= 1'b1;
				MemRead <= 1'b1;
				MemWrite <= 1'b0;
				NS <= LOADBYTE2;
				STATEC <= CS;
			end
			LOADBYTE2: begin
				RegWrite <= 1'b1;
				MemtoReg <= 3'b011;
				RegDst <= 2'b01;
				NS <= STATE0;
				STATEC <= CS;
			end
			STOREBYTE: begin
				IorD <= 1'b1;
				MemWrite <= 1'b1;
				MemRead <= 1'b0;
				BorD <= 1'b0;
				NS <= STATE0;
				STATEC <= CS;
			end
			WB_LONG: begin
				RegDst <= 2'b10;
				RegWrite <= 1'b1;
				MemtoReg <= 3'b000;
				NS <= STATE0;
				STATEC <= CS;
			end
			JAL: begin
				RegWrite <= 1'b1;
				RegDst <= 2'b11;
				MemtoReg <= 3'b110;
				STATEC <= CS;
			end
		endcase
	end
endmodule
