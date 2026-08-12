module tb_and16;
    reg  [15:0] a, b;
    wire [15:0] out;
    
    and16 uut(.a(a), .b(b), .out(out));
    
    initial begin
        // Test cases
        a = 16'b1111111111111111; b = 16'b0000000000000000; #10;
        $display("a=%b, b=%b, out=%b (expected: 0000000000000000)", a, b, out);
        
        a = 16'b1010101010101010; b = 16'b1111111111111111; #10;
        $display("a=%b, b=%b, out=%b (expected: 1010101010101010)", a, b, out);
        
        a = 16'b1100110011001100; b = 16'b1010101010101010; #10;
        $display("a=%b, b=%b, out=%b (expected: 1000100010001000)", a, b, out);
    end
endmodule
