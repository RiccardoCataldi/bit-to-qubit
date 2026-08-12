module mux4way16(
    input [15:0] a, 
    input [15:0] b, 
    input [15:0] c, 
    input [15:0] d, 
    input [1:0] sel, 
    output [15:0] out
);
    wire [15:0] q, r;
    
    // First level: choose between a,b and c,d
    mux16 m0(.a(a), .b(b), .s(sel[0]), .y(q));
    mux16 m1(.a(c), .b(d), .s(sel[0]), .y(r));
    
    // Second level: choose between q and r
    mux16 m2(.a(q), .b(r), .s(sel[1]), .y(out));
endmodule
