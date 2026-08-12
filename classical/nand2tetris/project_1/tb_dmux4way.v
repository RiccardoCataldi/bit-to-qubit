module tb_DMux4Way;
    reg in;
    reg [1:0] sel;
    wire a, b, c, d;
    
    DMux4Way uut(.in(in), .sel(sel), .a(a), .b(b), .c(c), .d(d));
    
    initial begin
        $display("Testing DMux4Way module");
        $display("=======================");
        
        // Test with input = 0 (should produce all zeros)
        $display("Testing with in = 0:");
        in = 1'b0;
        
        sel = 2'b00; #10;
        $display("sel=%b, in=%b -> a=%b, b=%b, c=%b, d=%b", sel, in, a, b, c, d);
        
        sel = 2'b01; #10;
        $display("sel=%b, in=%b -> a=%b, b=%b, c=%b, d=%b", sel, in, a, b, c, d);
        
        sel = 2'b10; #10;
        $display("sel=%b, in=%b -> a=%b, b=%b, c=%b, d=%b", sel, in, a, b, c, d);
        
        sel = 2'b11; #10;
        $display("sel=%b, in=%b -> a=%b, b=%b, c=%b, d=%b", sel, in, a, b, c, d);
        
        $display("");
        $display("Testing with in = 1:");
        in = 1'b1;
        
        sel = 2'b00; #10;
        $display("sel=%b, in=%b -> a=%b, b=%b, c=%b, d=%b (expected: a=1)", sel, in, a, b, c, d);
        
        sel = 2'b01; #10;
        $display("sel=%b, in=%b -> a=%b, b=%b, c=%b, d=%b (expected: b=1)", sel, in, a, b, c, d);
        
        sel = 2'b10; #10;
        $display("sel=%b, in=%b -> a=%b, b=%b, c=%b, d=%b (expected: c=1)", sel, in, a, b, c, d);
        
        sel = 2'b11; #10;
        $display("sel=%b, in=%b -> a=%b, b=%b, c=%b, d=%b (expected: d=1)", sel, in, a, b, c, d);
        
        $display("Test completed!");
        $finish;
    end
endmodule
