module Register_File #(parameter N = 32)(
	input 		clk,
	input 		reset,
	input 		Reg_Write_i,
	input [4:0] Write_Register_i,
	input [4:0] Read_Register_1_i,
	input [4:0] Read_Register_2_i,
	input [N-1:0] Write_Data_i,
	
	output [N-1:0] Read_Data_1_o,
	output [N-1:0] Read_Data_2_o
	);
	localparam enb = 1'b1;
	wire [N-1:0] enc;
	wire [N-1:0] q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16, q17, q18, q19, q20, q21, q22, q23, 
				    q24, q25, q26, q27, q28, q29, q30, q31;
	
	encoder E0 (.a(Write_Register_i),.en(enb),.enc(enc));

	
	ff_d  R0(.d(Write_Data_i), .clk(clk), .reset(reset), .enable(Reg_Write_i),  .q(q0));
	ff_d  R1(.d(Write_Data_i), .clk(clk), .reset(reset), .enable(enc[1]&Reg_Write_i),  .q(q1));
	ff_d  R2(.d(Write_Data_i), .clk(clk), .reset(reset), .enable(enc[2]&Reg_Write_i),  .q(q2));
	ff_d  R3(.d(Write_Data_i), .clk(clk), .reset(reset), .enable(enc[3]&Reg_Write_i),  .q(q3));
	ff_d  R4(.d(Write_Data_i), .clk(clk), .reset(reset), .enable(enc[4]&Reg_Write_i),  .q(q4));
	ff_d  R5(.d(Write_Data_i), .clk(clk), .reset(reset), .enable(enc[5]&Reg_Write_i),  .q(q5));
	ff_d  R6(.d(Write_Data_i), .clk(clk), .reset(reset), .enable(enc[6]&Reg_Write_i),  .q(q6));
	ff_d  R7(.d(Write_Data_i), .clk(clk), .reset(reset), .enable(enc[7]&Reg_Write_i),  .q(q7));
	ff_d  R8(.d(Write_Data_i), .clk(clk), .reset(reset), .enable(enc[8]&Reg_Write_i),  .q(q8));
	ff_d  R9(.d(Write_Data_i), .clk(clk), .reset(reset), .enable(enc[9]&Reg_Write_i),  .q(q9));
	ff_d R10(.d(Write_Data_i), .clk(clk), .reset(reset), .enable(enc[10]&Reg_Write_i), .q(q10));
	ff_d R11(.d(Write_Data_i), .clk(clk), .reset(reset), .enable(enc[11]&Reg_Write_i), .q(q11));
	ff_d R12(.d(Write_Data_i), .clk(clk), .reset(reset), .enable(enc[12]&Reg_Write_i), .q(q12));
	ff_d R13(.d(Write_Data_i), .clk(clk), .reset(reset), .enable(enc[13]&Reg_Write_i), .q(q13));
	ff_d R14(.d(Write_Data_i), .clk(clk), .reset(reset), .enable(enc[14]&Reg_Write_i), .q(q14));
	ff_d R15(.d(Write_Data_i), .clk(clk), .reset(reset), .enable(enc[15]&Reg_Write_i), .q(q15));
	ff_d R16(.d(Write_Data_i), .clk(clk), .reset(reset), .enable(enc[16]&Reg_Write_i), .q(q16));
	ff_d R17(.d(Write_Data_i), .clk(clk), .reset(reset), .enable(enc[17]&Reg_Write_i), .q(q17));
	ff_d R18(.d(Write_Data_i), .clk(clk), .reset(reset), .enable(enc[18]&Reg_Write_i), .q(q18));
	ff_d R19(.d(Write_Data_i), .clk(clk), .reset(reset), .enable(enc[19]&Reg_Write_i), .q(q19));
	ff_d R20(.d(Write_Data_i), .clk(clk), .reset(reset), .enable(enc[20]&Reg_Write_i), .q(q20));
	ff_d R21(.d(Write_Data_i), .clk(clk), .reset(reset), .enable(enc[21]&Reg_Write_i), .q(q21));
	ff_d R22(.d(Write_Data_i), .clk(clk), .reset(reset), .enable(enc[22]&Reg_Write_i), .q(q22));
	ff_d R23(.d(Write_Data_i), .clk(clk), .reset(reset), .enable(enc[23]&Reg_Write_i), .q(q23));
	ff_d R24(.d(Write_Data_i), .clk(clk), .reset(reset), .enable(enc[24]&Reg_Write_i), .q(q24));
	ff_d R25(.d(Write_Data_i), .clk(clk), .reset(reset), .enable(enc[25]&Reg_Write_i), .q(q25));
	ff_d R26(.d(Write_Data_i), .clk(clk), .reset(reset), .enable(enc[26]&Reg_Write_i), .q(q26));
	ff_d R27(.d(Write_Data_i), .clk(clk), .reset(reset), .enable(enc[27]&Reg_Write_i), .q(q27));
	ff_d R28(.d(Write_Data_i), .clk(clk), .reset(reset), .enable(enc[28]&Reg_Write_i), .q(q28));
	ff_d R29(.d(Write_Data_i), .clk(clk), .reset(reset), .enable(enc[29]&Reg_Write_i), .q(q29));
	ff_d R30(.d(Write_Data_i), .clk(clk), .reset(reset), .enable(enc[30]&Reg_Write_i), .q(q30));
	ff_d R31(.d(Write_Data_i), .clk(clk), .reset(reset), .enable(enc[31]&Reg_Write_i), .q(q31));
	
	
	mux_32 RD1(.I0(q0), .I1(q1), .I2(q2), .I3(q3), .I4(q4), .I5(q5), .I6(q6), .I7(q7), .I8(q8), .I9(q9), .I10(q10), .I11(q11),
	           .I12(q12), .I13(q13), .I14(q14), .I15(q15), .I16(q16), .I17(q17), .I18(q18), .I19(q19), .I20(q20), .I21(q21),
		   .I22(q22), .I23(q23), .I24(q24), .I25(q25), .I26(q26), .I27(q27), .I28(q28), .I29(q29), .I30(q30), .I31(q31),
		        .Sel(Read_Register_1_i), .Data(Read_Data_1_o));
	
	mux_32 RD2(.I0(q0), .I1(q1), .I2(q2), .I3(q3), .I4(q4), .I5(q5), .I6(q6), .I7(q7), .I8(q8), .I9(q9), .I10(q10), .I11(q11),
	           .I12(q12), .I13(q13), .I14(q14), .I15(q15), .I16(q16), .I17(q17), .I18(q18), .I19(q19), .I20(q20), .I21(q21),
		   .I22(q22), .I23(q23), .I24(q24), .I25(q25), .I26(q26), .I27(q27), .I28(q28), .I29(q29), .I30(q30), .I31(q31),
		        .Sel(Read_Register_2_i),.Data(Read_Data_2_o));
	
endmodule
