module tb_mux4way16;
    reg [15:0] a, b, c, d;
    reg [1:0] sel;
    wire [15:0] out;
    
    mux4way16 uut(.a(a), .b(b), .c(c), .d(d), .sel(sel), .out(out));
    
    initial begin
        $display("Testing MUX4WAY16 module");
        $display("========================");
        
        // Set test values
        a = 16'b0001000100010001;
        b = 16'b0010001000100010;
        c = 16'b0100010001000100;
        d = 16'b1000100010001000;
        
        // Test all select combinations
        sel = 2'b00; #10;
        $display("sel=%b, out=%b (expected: a=%b)", sel, out, a);
        
        sel = 2'b01; #10;
        $display("sel=%b, out=%b (expected: b=%b)", sel, out, b);
        
        sel = 2'b10; #10;
        $display("sel=%b, out=%b (expected: c=%b)", sel, out, c);
        
        sel = 2'b11; #10;
        $display("sel=%b, out=%b (expected: d=%b)", sel, out, d);
        
        $display("Test completed!");
        $finish;
    end
endmodule
