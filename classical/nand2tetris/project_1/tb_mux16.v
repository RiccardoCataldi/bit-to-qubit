module mux16_test;
    reg  [15:0] a, b;
    reg  s;
    wire [15:0] y;
    
    mux16 uut(.a(a), .b(b), .s(s), .y(y));
    
    initial begin
        $display("Testing MUX16 module");
        $display("====================");
        
        // Test sel=0 (should output a)
        a = 16'b1010101010101010; b = 16'b0101010101010101; s = 1'b0; #10;
        $display("a=%b, b=%b, sel=%b, y=%b (expected: a)", a, b, s, y);
        
        // Test sel=1 (should output b)
        a = 16'b1010101010101010; b = 16'b0101010101010101; s = 1'b1; #10;
        $display("a=%b, b=%b, sel=%b, y=%b (expected: b)", a, b, s, y);
        
        $finish;
    end
endmodule
