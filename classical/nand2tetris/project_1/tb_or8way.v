module tb_or8way;
    reg  [7:0] in;
    wire out;
    
    or8way uut(.in(in), .out(out));
    
    initial begin
        $display("Testing OR8WAY module");
        $display("=====================");
        
        // Test all zeros (should output 0)
        in = 8'b00000000; #10;
        $display("in=%b, out=%b (expected: 0)", in, out);
        
        // Test single bit set (should output 1)
        in = 8'b00000001; #10;
        $display("in=%b, out=%b (expected: 1)", in, out);
        
        in = 8'b00010000; #10;
        $display("in=%b, out=%b (expected: 1)", in, out);
        
        in = 8'b10000000; #10;
        $display("in=%b, out=%b (expected: 1)", in, out);
        
        // Test multiple bits set (should output 1)
        in = 8'b10101010; #10;
        $display("in=%b, out=%b (expected: 1)", in, out);
        
        // Test all ones (should output 1)
        in = 8'b11111111; #10;
        $display("in=%b, out=%b (expected: 1)", in, out);
        
        $display("Test completed!");
        $finish;
    end
endmodule
