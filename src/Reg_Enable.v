module Reg_Enable(
    input clk, enable,
    input [31:0] data_in,
    output reg [31:0] data_out
);

    always @(posedge clk) begin 
        if (enable) 
				data_out <= data_in;
    end

endmodule 