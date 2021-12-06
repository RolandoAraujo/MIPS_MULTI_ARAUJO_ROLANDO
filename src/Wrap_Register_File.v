module Wrap_Register_File #(parameter N = 32)(
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
	
	Register_File #(.N(N)) RF (.clk(clk), .reset(reset), .Reg_Write_i(Reg_Write_i), .Write_Register_i(Write_Register_i), .Read_Register_1_i(Read_Register_1_i), .Read_Register_2_i(Read_Register_2_i), .Write_Data_i(Write_Data_i), .Read_Data_1_o(Read_Data_1_o), .Read_Data_2_o(Read_Data_2_o));

endmodule
	