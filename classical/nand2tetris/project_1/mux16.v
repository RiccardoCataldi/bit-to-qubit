module mux16(input [15:0] a, input [15:0] b, input s, output [15:0] y);
    mux2_1 m0(.a(a[0]), .b(b[0]), .c(s), .y(y[0]));
    mux2_1 m1(.a(a[1]), .b(b[1]), .c(s), .y(y[1]));
    mux2_1 m2(.a(a[2]), .b(b[2]), .c(s), .y(y[2]));
    mux2_1 m3(.a(a[3]), .b(b[3]), .c(s), .y(y[3]));
    mux2_1 m4(.a(a[4]), .b(b[4]), .c(s), .y(y[4]));
    mux2_1 m5(.a(a[5]), .b(b[5]), .c(s), .y(y[5]));
    mux2_1 m6(.a(a[6]), .b(b[6]), .c(s), .y(y[6]));
    mux2_1 m7(.a(a[7]), .b(b[7]), .c(s), .y(y[7]));
    mux2_1 m8(.a(a[8]), .b(b[8]), .c(s), .y(y[8]));
    mux2_1 m9(.a(a[9]), .b(b[9]), .c(s), .y(y[9]));
    mux2_1 m10(.a(a[10]), .b(b[10]), .c(s), .y(y[10]));
    mux2_1 m11(.a(a[11]), .b(b[11]), .c(s), .y(y[11]));
    mux2_1 m12(.a(a[12]), .b(b[12]), .c(s), .y(y[12]));
    mux2_1 m13(.a(a[13]), .b(b[13]), .c(s), .y(y[13]));
    mux2_1 m14(.a(a[14]), .b(b[14]), .c(s), .y(y[14]));
    mux2_1 m15(.a(a[15]), .b(b[15]), .c(s), .y(y[15]));
endmodule
