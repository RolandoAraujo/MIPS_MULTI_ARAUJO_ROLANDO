module ff_d(d, clk, reset, enable, q);
input [31:0] d;
input clk, reset, enable;
output reg [31:0] q;
	
	always @ (posedge clk or negedge reset) begin
		if (!reset) begin
			q <= 0;
		end
		else begin
			if (enable) begin
				q <= d;
			end
		end
	end
	
endmodule 