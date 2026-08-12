module or8way(input [7:0] in, output out);
    wire w1, w2, w3, w4, w5, w6;
    
    // First level: OR pairs
    or2 g0(.a(in[0]), .b(in[1]), .y(w1));
    or2 g1(.a(in[2]), .b(in[3]), .y(w2));
    or2 g2(.a(in[4]), .b(in[5]), .y(w3));
    or2 g3(.a(in[6]), .b(in[7]), .y(w4));
    
    // Second level: OR the results
    or2 g4(.a(w1), .b(w2), .y(w5));
    or2 g5(.a(w3), .b(w4), .y(w6));
    
    // Final level: OR the final two
    or2 g6(.a(w5), .b(w6), .y(out));
endmodule

