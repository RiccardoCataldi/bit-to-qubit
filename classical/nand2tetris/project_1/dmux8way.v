// 8-way demultiplexer using existing modules
module DMux8Way(
    input in,
    input [2:0] sel,
    output a, b, c, d, e, f, g, h
);
    wire temp1, temp2;
    wire temp1_1, temp1_2, temp2_1, temp2_2;
    
    // Level 1: split input based on sel[2]
    // If sel[2]=0, route to temp1; if sel[2]=1, route to temp2
    dmux1_2 dmux1(.x(in), .s(sel[2]), .y(temp1), .z(temp2));
    
    // Level 2: split temp1 and temp2 based on sel[1]
    // temp1 goes to (temp1_1, temp1_2), temp2 goes to (temp2_1, temp2_2)
    dmux1_2 dmux2(.x(temp1), .s(sel[1]), .y(temp1_1), .z(temp1_2));
    dmux1_2 dmux3(.x(temp2), .s(sel[1]), .y(temp2_1), .z(temp2_2));
    
    // Level 3: split all four intermediate outputs using sel[0]
    dmux1_2 dmux4(.x(temp1_1), .s(sel[0]), .y(a), .z(b));
    dmux1_2 dmux5(.x(temp1_2), .s(sel[0]), .y(c), .z(d));
    dmux1_2 dmux6(.x(temp2_1), .s(sel[0]), .y(e), .z(f));
    dmux1_2 dmux7(.x(temp2_2), .s(sel[0]), .y(g), .z(h));
    
endmodule
