module Memory_System
#(
	parameter MEMORY_DEPTH = 64,
	parameter DATA_WIDTH = 32
)
(
	input Write_Enable_i, clk,
	input [(DATA_WIDTH-1):0] Write_Data_i,
	input [(DATA_WIDTH-1):0] Address_i,
	output [(DATA_WIDTH-1):0] Instruction_o
);

	
	wire  Outrom, Outram, InsSel;
	
	Program_Memory #(.DATA_WIDTH(DATA_WIDTH), .MEMORY_DEPTH(MEMORY_DEPTH)) RomMemory (.Address_i(Address_i), .Instruction_o(Outrom));
	single_port_ram #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(MEMORY_DEPTH)) RamMemory (.data(Write_Data_i), .addr(Address_i), .we(Write_Enable_i),.clk(clk),.q(Outram));
	Instruction_Select #(.MEMORY_DEPTH(MEMORY_DEPTH)) Selector (.Addr_inst(Address_i), .Sel(InsSel));
	
	
	muxselect SelectInstrDat (.S0(Outrom), .S1(Outram), .I(InsSel), .O(Instruction_o));
	
	
endmodule	