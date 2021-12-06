module ALU #(parameter WIDTH=32)
(		 
output reg 	[WIDTH -1: 0] 	y,
input		[WIDTH -1: 0]	a, b,
input		[2: 0]	select
);

always @ (*)
begin
y= 32'h00000000;
case (select)
3'b000:	y = a + b;
3'b001:	y = a - b;
3'b010:	y = a & b;
3'b011:  y = a | b;
3'b100:	y = a + (~b);
3'b101:	y= 32'h00000000;
3'b110:	y = a ^ b;
3'b111:	y = a & (~b);
default:		y = 32'h00000000;
endcase
end
endmodule
