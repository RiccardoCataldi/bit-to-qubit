module or16_test;
    reg  [15:0] a, b;
    wire [15:0] out;
    
    or16 uut(.a(a), .b(b), .out(out));
    
    initial begin
        $display("Testing OR16 module");
        $display("===================");
        
        // Test case 1: All zeros
        a = 16'b0000000000000000; b = 16'b0000000000000000; #10;
        $display("a=%b, b=%b, out=%b (expected: 0000000000000000)", a, b, out);
        
        // Test case 2: All ones OR all zeros
        a = 16'b1111111111111111; b = 16'b0000000000000000; #10;
        $display("a=%b, b=%b, out=%b (expected: 1111111111111111)", a, b, out);
        
        // Test case 3: Alternating patterns
        a = 16'b1010101010101010; b = 16'b0101010101010101; #10;
        $display("a=%b, b=%b, out=%b (expected: 1111111111111111)", a, b, out);
        
        // Test case 4: Partial overlap
        a = 16'b1100110011001100; b = 16'b1010101010101010; #10;
        $display("a=%b, b=%b, out=%b (expected: 1110111011101110)", a, b, out);
        
        // Test case 5: All ones
        a = 16'b1111111111111111; b = 16'b1111111111111111; #10;
        $display("a=%b, b=%b, out=%b (expected: 1111111111111111)", a, b, out);
        
        $display("Test completed!");
        $finish;
    end
endmodule
