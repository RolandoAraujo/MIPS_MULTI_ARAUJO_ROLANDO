module Instruction_Select #(
	parameter MEMORY_DEPTH = 32
)
(
input [(MEMORY_DEPTH-1):0] Addr_inst,
output reg Sel
);

always @ (Addr_inst) begin 
	if (Addr_inst >= 32'h40_000 && Addr_inst < 32'h1000_0000) 
		Sel = 1;
	
	else if (Addr_inst>= 32'h1000_000)
		Sel = 0;

end 

endmodule 