// Design of the above 5:32 decoder circuit using 4 3:8 and 1 2:4 decoder

module encoder(

input [4:0] a,                                 // 5 input lines

input en,                                       // enable pin

output [31:0] enc );                        // 32 output lines

wire [3:0] w;                                //for storing the output of 2:4 decoder

decoder2x4 x1(w,a[4:3],en);     // Calling 2:4 decoder with en and a[4:3] as inputs and w as                                                          //output

decoder3x8 x2(enc[7:0], a[2:0],w[0]);  // Calling 3:8 decoder with[0] as enable

decoder3x8 x3(enc[15:8], a[2:0],w[1]);

decoder3x8 x4(enc[23:16], a[2:0],w[2]);

decoder3x8 x5(enc[31:24], a[2:0],w[3]);

endmodule

//2:4 decoder

module decoder2x4(

output reg [3:0] enc,

input [1:0] a,

input en);

always @(a,en)               // behavioral modeling, give all the inputs inside always block


if(en)

case(a)

2'b00: enc=4'b0001;    // Use the truth table. Very easy to code in behavioral modeling.

2'b01: enc=4'b0010;

2'b10: enc=4'b0100;

2'b11: enc=4'b1000;

default: enc=0;

endcase

else enc=0;              //if en=0, the output should be 0

endmodule

// 3:8 decoder

module decoder3x8(

output reg [7:0] enc,

input [2:0] a,

input en);

always @(a,en)

if(en)

case(a)                                  // Use truth table of 3:8 decoder


0: enc =8'b00000001;           // if input is 000=0

1: enc =8'b00000010;           // if input is 001=1

2: enc =8'b00000100;

3: enc =8'b00001000;

4: enc =8'b00010000;

5: enc =8'b00100000;

6: enc =8'b01000000;

7: enc =8'b10000000;

default: enc=0;

endcase

else enc=0;        // if en=0, y=0

endmodule
