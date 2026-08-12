module inc16(
    input [15:0] a,
    output [15:0] y
);
    wire cout_unused; // carry out is not used in increment
    
    add16 add (
        .a(a), 
        .b(16'h0001),    // add 1 (correct syntax for 16-bit constant)
        .cin(1'b0),      // no carry in
        .sum(y),         // output sum
        .cout(cout_unused) // carry out (unused but must be connected)
    );
    
endmodule
