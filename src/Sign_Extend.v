module Sign_Extend
(
	input [15:0] SE_I,
	output wire [31:0] SE_O
);
localparam add = 16'b1111111111111111;

assign	SE_O = {add,SE_I[15]};
endmodule 