// Testbench for DMux8Way
module tb_DMux8Way;
    reg in;
    reg [2:0] sel;
    wire a, b, c, d, e, f, g, h;
    
    DMux8Way uut(.in(in), .sel(sel), .a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g), .h(h));
    
    initial begin
        $display("Testing DMux8Way module");
        $display("=======================");
        
        // Test with input = 0 (should produce all zeros)
        $display("Testing with in = 0:");
        in = 1'b0;
        
        sel = 3'b000; #10;
        $display("sel=%b, in=%b -> a=%b, b=%b, c=%b, d=%b, e=%b, f=%b, g=%b, h=%b", sel, in, a, b, c, d, e, f, g, h);
        
        sel = 3'b001; #10;
        $display("sel=%b, in=%b -> a=%b, b=%b, c=%b, d=%b, e=%b, f=%b, g=%b, h=%b", sel, in, a, b, c, d, e, f, g, h);
        
        sel = 3'b010; #10;
        $display("sel=%b, in=%b -> a=%b, b=%b, c=%b, d=%b, e=%b, f=%b, g=%b, h=%b", sel, in, a, b, c, d, e, f, g, h);
        
        sel = 3'b011; #10;
        $display("sel=%b, in=%b -> a=%b, b=%b, c=%b, d=%b, e=%b, f=%b, g=%b, h=%b", sel, in, a, b, c, d, e, f, g, h);
        
        sel = 3'b100; #10;
        $display("sel=%b, in=%b -> a=%b, b=%b, c=%b, d=%b, e=%b, f=%b, g=%b, h=%b", sel, in, a, b, c, d, e, f, g, h);
        
        sel = 3'b101; #10;
        $display("sel=%b, in=%b -> a=%b, b=%b, c=%b, d=%b, e=%b, f=%b, g=%b, h=%b", sel, in, a, b, c, d, e, f, g, h);
        
        sel = 3'b110; #10;
        $display("sel=%b, in=%b -> a=%b, b=%b, c=%b, d=%b, e=%b, f=%b, g=%b, h=%b", sel, in, a, b, c, d, e, f, g, h);
        
        sel = 3'b111; #10;
        $display("sel=%b, in=%b -> a=%b, b=%b, c=%b, d=%b, e=%b, f=%b, g=%b, h=%b", sel, in, a, b, c, d, e, f, g, h);
        
        $display("");
        $display("Testing with in = 1:");
        in = 1'b1;
        
        sel = 3'b000; #10;
        $display("sel=%b, in=%b -> a=%b, b=%b, c=%b, d=%b, e=%b, f=%b, g=%b, h=%b (expected: a=1)", sel, in, a, b, c, d, e, f, g, h);
        
        sel = 3'b001; #10;
        $display("sel=%b, in=%b -> a=%b, b=%b, c=%b, d=%b, e=%b, f=%b, g=%b, h=%b (expected: b=1)", sel, in, a, b, c, d, e, f, g, h);
        
        sel = 3'b010; #10;
        $display("sel=%b, in=%b -> a=%b, b=%b, c=%b, d=%b, e=%b, f=%b, g=%b, h=%b (expected: c=1)", sel, in, a, b, c, d, e, f, g, h);
        
        sel = 3'b011; #10;
        $display("sel=%b, in=%b -> a=%b, b=%b, c=%b, d=%b, e=%b, f=%b, g=%b, h=%b (expected: d=1)", sel, in, a, b, c, d, e, f, g, h);
        
        sel = 3'b100; #10;
        $display("sel=%b, in=%b -> a=%b, b=%b, c=%b, d=%b, e=%b, f=%b, g=%b, h=%b (expected: e=1)", sel, in, a, b, c, d, e, f, g, h);
        
        sel = 3'b101; #10;
        $display("sel=%b, in=%b -> a=%b, b=%b, c=%b, d=%b, e=%b, f=%b, g=%b, h=%b (expected: f=1)", sel, in, a, b, c, d, e, f, g, h);
        
        sel = 3'b110; #10;
        $display("sel=%b, in=%b -> a=%b, b=%b, c=%b, d=%b, e=%b, f=%b, g=%b, h=%b (expected: g=1)", sel, in, a, b, c, d, e, f, g, h);
        
        sel = 3'b111; #10;
        $display("sel=%b, in=%b -> a=%b, b=%b, c=%b, d=%b, e=%b, f=%b, g=%b, h=%b (expected: h=1)", sel, in, a, b, c, d, e, f, g, h);
        
        $display("Test completed!");
        $finish;
    end
endmodule
