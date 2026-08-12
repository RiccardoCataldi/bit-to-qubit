module alu(input [15:0] x, input [15:0] y, input zx,input nx,input zy,input ny,input f,input no,output [15:0] out, output zr,output ng);
    wire [15:0] w1,w2,w3;
    wire [15:0] w4,w5,w6;
    wire [15:0] w7,w8,w9,w10,w11;
    wire cout_unused; // carry out from add16 (not used in ALU)
    wire or_low, or_high, or_total;  // for zero flag computation
    
    // Process x
    mux16 m1(.a(x), .b(16'b0), .s(zx), .y(w1));        // Zero x if zx=1
    not16 n1(.in(w1), .out(w2));                        // NOT x
    mux16 m2(.a(w1), .b(w2), .s(nx), .y(w3));          // Choose x or ~x
    
    // Process y  
    mux16 m3(.a(y), .b(16'b0), .s(zy), .y(w4));        // Zero y if zy=1
    not16 n2(.in(w4), .out(w5));                        // NOT y
    mux16 m4(.a(w4), .b(w5), .s(ny), .y(w6));          // Choose y or ~y
    
    // Function computation
    add16 a1(.a(w3), .b(w6), .cin(1'b0), .sum(w7), .cout(cout_unused)); // Addition
    and16 and1(.a(w3), .b(w6), .out(w8));              // AND operation
    mux16 m5(.a(w8), .b(w7), .s(f), .y(w9));          // Choose function (AND or ADD)
    
    // Final negation
    not16 n3(.in(w9), .out(w10));                       // NOT result
    mux16 m6(.a(w9), .b(w10), .s(no), .y(w11));       // Choose final result
    
    // Output
    assign out = w11;
    
    // Zero flag: zr = 1 if all bits of out are 0
    or8way or_low_inst(.in(w11[7:0]), .out(or_low));   // OR lower 8 bits
    or8way or_high_inst(.in(w11[15:8]), .out(or_high)); // OR upper 8 bits
    or2 or_final(.a(or_low), .b(or_high), .y(or_total)); // OR the results
    not2 not_zr(.a(or_total), .y(zr));                 // zr = NOT(or_total)
    
    // Negative flag: ng = MSB of output (sign bit in 2's complement)
    assign ng = w11[15];
    
endmodule
