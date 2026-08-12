module DMux4Way(
    input in,
    input [1:0] sel,
    output a, b, c, d
);
    wire temp1, temp2;
    
    dmux1_2 dmux1(.x(in), .s(sel[1]), .y(temp1), .z(temp2));
    dmux1_2 dmux2(.x(temp1), .s(sel[0]), .y(a), .z(b));
    dmux1_2 dmux3(.x(temp2), .s(sel[0]), .y(c), .z(d));
endmodule
