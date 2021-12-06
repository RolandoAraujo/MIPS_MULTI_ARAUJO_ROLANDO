module Wrap_Memory_System
#(
	parameter MEMORY_DEPTH = 64,
	parameter DATA_WIDTH = 32
)
(
	input Write_Enable_i, clk,
	input [(DATA_WIDTH-1):0] Write_Data_i,
	input [(MEMORY_DEPTH-1):0] Address_i,
	output [(DATA_WIDTH-1):0] Instruction_o
);

Memory_System  #(.MEMORY_DEPTH(MEMORY_DEPTH ), .DATA_WIDTH(DATA_WIDTH)) MS ( .Write_Enable_i(Write_Enable_i), .clk(clk), .Write_Data_i(Write_Data_i), .Address_i(Address_i), .Instruction_o(Instruction_o));
						 
endmodule
