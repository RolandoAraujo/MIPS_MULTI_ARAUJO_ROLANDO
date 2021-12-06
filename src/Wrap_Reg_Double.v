module Wrap_Reg_Double(
    input clk,
    input  [31:0] data_A_in, data_B_in,
    output [31:0] data_A_out, data_B_out
);

    Reg_Double RD(.clk(clk), .data_A_in(data_A_in), .data_A_out(data_A_out), .data_B_in(data_B_in), .data_B_out(data_B_out));   

endmodule 