module MIPS_Single_Cycle
#(	
	parameter MEMORY_DEPTH 	= 64,
	parameter DATA_WIDTH 	= 32,
	parameter Instruction_Range_i = 32'h400000
)
(
	//inputs
	input clk,
	input reset,
	//output
	output [7:0] GPIO_O,
	
	/***** Señales de Control *****/
	input PCWrite, IorD, MemWrite, IRWrite, MemtoReg, RegWrite, ALUSrcA, CUS,
	input [1:0] ALUSrcB,
	input [3:0] ALUControl,
   input PCSrc
 
	/******************************/
	
	);
	//Wires list
	wire [31:0] PCW_i, PCW_o, ALUOut, ADR, RegDB, MS_O, RI_O, RD_O, Data_W, Memtoreg_W, WD3_W, RD1_W, RD2_W, 
	SignImm_W, A_W, B_W, SrcA_W, SrcB_W, ALUResult;
	wire [4:0] A1, A2, A3;
	localparam constant = 32'h1;
	
	// Reg PC
	Reg_Enable PCReg (.clk(clk), .enable(PCWrite), .data_in(PCW_i), .data_out(PCW_O));
	
	//IorD Mux
	muxselect IorDMux (.S0(PCW_O), .S1(ALUOut), .I(IorD), .O(ADR));
	
	//Memory System
	Wrap_Memory_System #(.MEMORY_DEPTH(MEMORY_DEPTH ), .DATA_WIDTH(DATA_WIDTH)) ID_Memory ( .Write_Enable_i(MemWrite), .clk(clk), .Write_Data_i(RegDB), .Address_i(ADR), .Instruction_o(MS_O));
	
	//Reg Instr, Reg Data
	Reg_Enable InstrReg (.clk(clk), .enable(IRWrite), .data_in(MS_O), .data_out(RI_O));
	Reg_Direct DataReg (.clk(clk), .data_in(MS_O), .data_out(RD_O));
	
	//RegData Mux, MemtoReg Mux
	muxselect RegDataMux (.S0(RI_O[20:16]), .S1(RI_O[15:11]), .I(CUS), .O(A3));
	muxselect MemtoRegDMux (.S0(RD_O), .S1(ALUOut), .I(MemtoReg), .O(WD3_W));
	
	//Register File
	Wrap_Register_File #(.N(DATA_WIDTH)) RF (.clk(clk), .reset(reset), .Reg_Write_i(RegWrite),.Write_Register_i(A3), .Read_Register_1_i(A1), .Read_Register_2_i(A2),	.Write_Data_i(WD3_W), .Read_Data_1_o(RD1_W), .Read_Data_2_o(RD2_W));
	
	//SignExtend
	Sign_Extend SE (.SE_I(RI_O [15:0]), .SE_O(SignImm_W));
	
	//RegAB
	Wrap_Reg_Double RD (.clk(clk), .data_A_in(RD1_W), .data_A_out(A_W), .data_B_in(RD2_W), .data_B_out(B_W));   
	
	//Mux ALUSrcA, Mux ALUSrcB
	muxselect ALUSrc_A (.S0(A_W), .S1(PCW_O), .I(ALUSrcA), .O(SrcA_W));
	Mux4to1 #(.WIDTH(DATA_WIDTH)) ALUSrc_B (.I1(B_W), .I2(constant), .I3(SignImm_W), .select(ALUSrcB), .Out(SrcB_W));
	
	//ALU
	ALU #(.WIDTH(DATA_WIDTH)) Alu (.a(SrcA_W), .b(SrcB_W), .select(ALUControl), .y(ALUResult));
	
	//Reg ALUOUt
	Reg_Direct AluOut (.clk(clk), .data_in(ALUResult), .data_out(ALUOut));
	
	//Mux ALUOut
	muxselect ALUOUT (.S0(ALUResult), .S1(ALUOut), .I(PCSrc), .O(PCW_i));



	
endmodule
