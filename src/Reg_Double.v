module Reg_Double(
    input clk,
    input  [31:0] data_A_in, data_B_in,
    output [31:0] data_A_out, data_B_out
);

    Reg_Direct RA(.clk(clk), .data_in(data_A_in), .data_out(data_A_out));
    Reg_Direct RB(.clk(clk), .data_in(data_B_in), .data_out(data_B_out));

endmodule 