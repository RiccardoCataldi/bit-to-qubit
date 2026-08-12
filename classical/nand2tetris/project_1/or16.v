module or16(input [15:0] a, input [15:0] b, output [15:0] out);
    or2 n0(.a(a[0]), .b(b[0]), .y(out[0]));
    or2 n1(.a(a[1]), .b(b[1]), .y(out[1]));
    or2 n2(.a(a[2]), .b(b[2]), .y(out[2]));
    or2 n3(.a(a[3]), .b(b[3]), .y(out[3]));
    or2 n4(.a(a[4]), .b(b[4]), .y(out[4]));
    or2 n5(.a(a[5]), .b(b[5]), .y(out[5]));
    or2 n6(.a(a[6]), .b(b[6]), .y(out[6]));
    or2 n7(.a(a[7]), .b(b[7]), .y(out[7]));
    or2 n8(.a(a[8]), .b(b[8]), .y(out[8]));
    or2 n9(.a(a[9]), .b(b[9]), .y(out[9]));
    or2 n10(.a(a[10]), .b(b[10]), .y(out[10]));
    or2 n11(.a(a[11]), .b(b[11]), .y(out[11]));
    or2 n12(.a(a[12]), .b(b[12]), .y(out[12]));
    or2 n13(.a(a[13]), .b(b[13]), .y(out[13]));
    or2 n14(.a(a[14]), .b(b[14]), .y(out[14]));
    or2 n15(.a(a[15]), .b(b[15]), .y(out[15]));
endmodule
