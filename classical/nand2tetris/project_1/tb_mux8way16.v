module tb_mux8way16;
    reg [15:0] a, b, c, d, e, f, g, h;
    reg [2:0] sel;
    wire [15:0] out;
    
    mux8way16 uut(.a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g), .h(h), .sel(sel), .out(out));
    
    initial begin
        $display("Testing MUX8WAY16 module");
        $display("========================");
        
        // Set test values
        a = 16'b0001000100010001;
        b = 16'b0010001000100010;
        c = 16'b0100010001000100;
        d = 16'b1000100010001000;
        e = 16'b0001001000110001;
        f = 16'b0010010001100010;
        g = 16'b0100100011000100;
        h = 16'b1001000110001000;
        
        // Test all select combinations
        sel = 3'b000; #10;
        $display("sel=%b, out=%b (expected: a=%b)", sel, out, a);
        
        sel = 3'b001; #10;
        $display("sel=%b, out=%b (expected: b=%b)", sel, out, b);
        
        sel = 3'b010; #10;
        $display("sel=%b, out=%b (expected: c=%b)", sel, out, c);
        
        sel = 3'b011; #10;
        $display("sel=%b, out=%b (expected: d=%b)", sel, out, d);
        
        sel = 3'b100; #10;
        $display("sel=%b, out=%b (expected: e=%b)", sel, out, e);
        
        sel = 3'b101; #10;
        $display("sel=%b, out=%b (expected: f=%b)", sel, out, f);
        
        sel = 3'b110; #10;
        $display("sel=%b, out=%b (expected: g=%b)", sel, out, g);
        
        sel = 3'b111; #10;
        $display("sel=%b, out=%b (expected: h=%b)", sel, out, h);
        
        $display("Test completed!");
        $finish;
    end
endmodule
