module muxselect(
output O,
input S0, S1, I);

assign O=(I) ? S1:S0;

endmodule
