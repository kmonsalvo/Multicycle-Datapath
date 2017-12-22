`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:55:18 11/20/2017 
// Design Name: 
// Module Name:    multicycledatapath 
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
module multicycledatapath(nrst, A, B, inst_address, regdata);
	input nrst;
	output [15:0] A;
	output [15:0] B;
	output [15:0] inst_address;
	output [15:0] regdata;
		 
		 //Outputs of this module will go to a testbench and be used for debugging 
		 assign A = rd1_delayed;
		 assign B = rd2_delayed;
		 assign inst_address = pcmux;
		 assign regdata = alu_result_delayed;
	 
		
		 //Control Module Wires
		 wire pcwrite;
		 wire IorD;
		 wire MemWrite;
		 wire MemRead;
		 wire zero;
		 wire BorD, IRWrite;
		 wire AluSrcA;
		 wire jr;
		 wire bnez;
		 wire beqz;
		 wire jump;
		 wire [2:0] RegDst;
		 wire [2:0] AluSrcB;
		 wire [2:0] MemtoReg;
		 wire [1:0] PCSrc;
		 wire [1:0] ALU;  //main controller to alu controller
		 wire [3:0] ALUOP; //alu controller to ALU
		 
		 
		 //Module to Module wires
		 wire clk;
		 wire [15:0] pcaddress;
		 wire [15:0] newpcaddress;
		 wire [15:0] rd1;
		 wire [15:0] rd1_delayed;
		 wire [15:0] rd2;
		 wire [15:0] rd2_delayed;
		 wire [15:0] alu_result;
		 wire [15:0] alu_result_delayed;
		 wire [15:0] memdata;
		 wire [15:0] memdata_delayed;
		 wire [3:0]  aluop;
		 
		 
		 //Wire Concatenations
		 wire [7:0] rd2_byte;
		 wire [7:0] memdata_byte;
		 assign rd2_byte = rd2_delayed [7:0];
		 wire [15:0] instndata;
		 wire [15:0] instndata_delayed;
		 assign memdata_byte = instndata_delayed [7:0];
		 
		 wire [4:0] op;
		 wire [2:0] rs;
		 wire [2:0] rt;
		 wire [2:0] rd;
		 wire [2:0] wa;
		 wire [2:0] regaddress;
		 wire [1:0] funct;
		 wire [4:0] imm;
		 wire [7:0] imm_long;
		 wire [10:0] address;
		 
		 wire [15:0] signextimm;
		 wire [15:0] signextimm_shift;
		 wire [15:0] zeroextimm;
		 wire [15:0] signextimm_long;
		 wire [15:0] zeroextimm_long;
		 wire [15:0] shiftresult;
		 
		 
		 wire [15:0] storebytewire;
		 wire [15:0] loadbytewire;
		 wire [15:0] luiwire;

		 
		 //Mux Output Wires
		 wire [15:0] alusrca;
		 wire [15:0] alusrcb;
		 wire [15:0] pcmux;
		 wire [15:0] regdst_wire;
		 wire [15:0] iordwire;
		 wire [15:0] bordwire;
		 wire [15:0] wd;
		 wire [15:0] jumpwire;
		 
		 //Jump Concatenation
		 wire [15:0] jumpaddress;
		 assign jumpaddress = {newpcaddress[15:11], address, 1'b0};
		 
		 //MUX Modules
		 mux8to1 MUX4(.in0(rd2_delayed), .in1(16'd2), .in2(signextimm), 
		 .in3(zeroextimm), .in4(signextimm_shift), .in5(signextimm_long), 
		 .in6(zeroextimm_long), .in7(16'd0), .sel(AluSrcB), .out(alusrcb));
		 
		 mux2x1_16bit MUX1(.A(newpcaddress), .B(rd1_delayed), .OP(AluSrcA), .R(alusrca)); //alusrca
		 
		 mux2x1_16bit MUX2(.A(newpcaddress), .B(alu_result_delayed), .OP(IorD), .R(iordwire)); //IorD
		 
		 mux2x1_16bit MUX3(.A(storebytewire), .B(rd2_delayed), .OP(BorD), .R(bordwire)); //BorD
		 
		 mux4x1_16bit MUX7(.in0(alu_result), .in1(rd1_delayed), .in2(alu_result_delayed),  //PCSrc
		 .in3(jumpadress), .out(pcmux), .sel(PCSrc));
		 
		 mux4x1_3bit MUX6(.in0(rt), .in1(rd), .in2(rs), .in3(3'b111), .out(wa), .sel(RegDst)); //RegDst
		 
		 Mux6to1 MUX5(.in0(alu_result_delayed), .in1(shiftresult), .in2(shiftresult), //MemtoReg
		 .in3(instndata_delayed), .in4(loadbytewire), .in5(luiwire), .sel(MemToReg), .out(wd)); 

		 //Data Path Modules
		 clock A1(.clk(clk));  //Clock
		 
		 //Controllers
		 controlmodule C1(.OP(op), .nrst(nrst), .clk(clk), .PCSrc(PCSrc), .PCWrite(pcwrite), .IorD(IorD), 
		 .MemRead(MemRead), .MemWrite(MemWrite), .IRWrite(IRWrite), .jr(jr), .MemtoReg(MemtoReg), 
		 .RegDst(RegDst), .RegWrite(RegWrite), .ALUSrcA(AluSrcA), .ALUSrcB(AluSrcB), .ALU(ALU), .BorD(BorD),
		 .beqz(beqz), .bnez(bnez), .jump(jump));
		 
		 alucontroller C2(.aluop(ALU), .funct(funct), .clk(clk), .op(ALUOP));
		 
		 
		 //Main Modules
		 regfile M1(.ra1(rs), .ra2(rt), .wa(wa), .wd(wd), .RegWrite(RegWrite), .clk(clk), .rd1(rd1), .rd2(rd2));
		 
		 memory M2(.addr(iordwire), .data(bordwire), .MemWrite(MemWrite), .MemRead(MemRead), .clk(clk),  .inst_out(instndata));
		 
		 ALU_16BIT M3(.A(rd1_delayed), .B(alusrcb), .OP(ALUOP), .ZERO(zero), .Result(aluresult));
		 
		 signext M4(.imm(imm), .sign_imm(signextimm));
		 
		 zeroext M5(.imm(imm), .zeroext(zeroextimm));
		 
		 shiftone M6(.signextimm(signextimm), .extshift(signextimm_shift));  //Branch Address Calculation
		 
		 signextlong M7(.imm(imm_long), .sign_imm(signextimm_long));
		 
		 zeroextlong M8(.imm(imm_long), .zero_imm(zeroextimm_long));
		 
		 storebyte M9(.rd2(rd2_byte), .data(storebytewire));
		 
		 loadbyte M10(.databyte(memdata_byte), .data(loadbytewire));
		 
		 shifter M11(.rt(rd2_delayed), .imm(imm), .control(op[0]),  .shiftresult(shiftresult));	
		 
		 lui M12(.imm(imm), .out(luiwire));
		 
		 //Registers
		 loadregister R1(.instruction(instndata), .pcaddress(pcaddress), .pcwrite(pcwrite), .IRwrite(IRWrite), 
		 .newpcaddress(newpcaddress), .OP(op), .RS(rs), .RT(rt), .RD(rd), .FUNCT(funct), .IMM(imm),
		 .LONG_IMM(imm_long), .ADDRESS(address));
		 
		 register R2(.aluresult(alu_result), .regdata1(rd1),.regdata2(rd2), .memdata(instndata),
		 .ALUOUT(alu_result_delayed), .A(rd1_delayed), .B(rd2_delayed), .MEMDATA(instndata_delayed));

		 
endmodule
