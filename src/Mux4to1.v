module Mux4to1
#(
	parameter WIDTH = 32
)
(
	input [WIDTH-1:0] data_1, data_2, data_3, data_4,
	input [1:0]	selector,
	output [WIDTH-1:0] data_o
);

reg [WIDTH-1:0] data;
reg [WIDTH-1:0] constant = 32'h1;
always @(*)
begin
case (selector)

	2'b00: begin
	data <= data_1;
	end
	2'b01: begin
	data <= constant;
	end
	2'b10: begin
	data <= data_3;
	end
	2'b11: begin
	data <= data_4;
	end
endcase
end
assign data_2 = constant;
assign data_o = data; 
endmodule 