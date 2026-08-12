module mux8way16(
    input [15:0] a, b, c, d, e, f, g, h,
    input [2:0] sel,    // 3 bits for 8 inputs
    output [15:0] out
);
    wire [15:0] q1, q2, q3, q4, r1, r2;
    
    // Level 1: 4 mux16s, each choosing between pairs
    mux16 m0(.a(a), .b(b), .s(sel[0]), .y(q1));  // sel[0] chooses within (a,b)
    mux16 m1(.a(c), .b(d), .s(sel[0]), .y(q2));  // sel[0] chooses within (c,d)
    mux16 m2(.a(e), .b(f), .s(sel[0]), .y(q3));  // sel[0] chooses within (e,f)
    mux16 m3(.a(g), .b(h), .s(sel[0]), .y(q4));  // sel[0] chooses within (g,h)
    
    // Level 2: 2 mux16s, choosing between pairs of results
    mux16 m4(.a(q1), .b(q2), .s(sel[1]), .y(r1)); // sel[1] chooses between (a,b)|(c,d)
    mux16 m5(.a(q3), .b(q4), .s(sel[1]), .y(r2)); // sel[1] chooses between (e,f)|(g,h)
    
    // Level 3: Final choice
    mux16 m6(.a(r1), .b(r2), .s(sel[2]), .y(out)); // sel[2] makes final choice
endmodule
