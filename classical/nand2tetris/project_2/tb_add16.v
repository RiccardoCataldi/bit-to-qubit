`timescale 1ns/1ps

module tb_add16;
    reg [15:0] a, b;
    reg cin;
    wire [15:0] sum;
    wire cout;
    
    // Instantiate the 16-bit adder
    add16 dut(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));
    
    initial begin
        // Setup VCD dump for waveform viewing
        $dumpfile("add16.vcd");
        $dumpvars(0, tb_add16);
        
        // Display header
        $display("Test | a (hex) | b (hex) | cin | sum (hex) | cout | Expected");
        $display("-----|---------|---------|-----|-----------|------|----------");
        
        // Test 1: Basic addition - no carry
        a = 16'h0001; b = 16'h0002; cin = 1'b0; #1
        $display("  1  |  %04h   |  %04h   |  %b  |   %04h    |  %b   | 0003", a, b, cin, sum, cout);
        
        // Test 2: Addition with carry in
        a = 16'h0001; b = 16'h0002; cin = 1'b1; #1
        $display("  2  |  %04h   |  %04h   |  %b  |   %04h    |  %b   | 0004", a, b, cin, sum, cout);
        
        // Test 3: Zero addition
        a = 16'h0000; b = 16'h0000; cin = 1'b0; #1
        $display("  3  |  %04h   |  %04h   |  %b  |   %04h    |  %b   | 0000", a, b, cin, sum, cout);
        
        // Test 4: Maximum values - should overflow
        a = 16'hFFFF; b = 16'hFFFF; cin = 1'b0; #1
        $display("  4  |  %04h   |  %04h   |  %b  |   %04h    |  %b   | FFFE, cout=1", a, b, cin, sum, cout);
        
        // Test 5: Maximum values with carry - should overflow
        a = 16'hFFFF; b = 16'hFFFF; cin = 1'b1; #1
        $display("  5  |  %04h   |  %04h   |  %b  |   %04h    |  %b   | FFFF, cout=1", a, b, cin, sum, cout);
        
        // Test 6: One operand is zero
        a = 16'hABCD; b = 16'h0000; cin = 1'b0; #1
        $display("  6  |  %04h   |  %04h   |  %b  |   %04h    |  %b   | ABCD", a, b, cin, sum, cout);
        
        // Test 7: Powers of 2
        a = 16'h8000; b = 16'h8000; cin = 1'b0; #1
        $display("  7  |  %04h   |  %04h   |  %b  |   %04h    |  %b   | 0000, cout=1", a, b, cin, sum, cout);
        
        // Test 8: Alternating bit pattern
        a = 16'h5555; b = 16'hAAAA; cin = 1'b0; #1
        $display("  8  |  %04h   |  %04h   |  %b  |   %04h    |  %b   | FFFF", a, b, cin, sum, cout);
        
        // Test 9: Alternating bit pattern with carry
        a = 16'h5555; b = 16'hAAAA; cin = 1'b1; #1
        $display("  9  |  %04h   |  %04h   |  %b  |   %04h    |  %b   | 0000, cout=1", a, b, cin, sum, cout);
        
        // Test 10: Small numbers
        a = 16'h0005; b = 16'h0003; cin = 1'b0; #1
        $display(" 10  |  %04h   |  %04h   |  %b  |   %04h    |  %b   | 0008", a, b, cin, sum, cout);
        
        // Test 11: Carry propagation test
        a = 16'h00FF; b = 16'h0001; cin = 1'b0; #1
        $display(" 11  |  %04h   |  %04h   |  %b  |   %04h    |  %b   | 0100", a, b, cin, sum, cout);
        
        // Test 12: Multiple carry propagation
        a = 16'h0FFF; b = 16'h0001; cin = 1'b0; #1
        $display(" 12  |  %04h   |  %04h   |  %b  |   %04h    |  %b   | 1000", a, b, cin, sum, cout);
        
        // Test 13: Edge case - near overflow
        a = 16'hFFFE; b = 16'h0001; cin = 1'b0; #1
        $display(" 13  |  %04h   |  %04h   |  %b  |   %04h    |  %b   | FFFF", a, b, cin, sum, cout);
        
        // Test 14: Edge case - exactly overflow
        a = 16'hFFFF; b = 16'h0001; cin = 1'b0; #1
        $display(" 14  |  %04h   |  %04h   |  %b  |   %04h    |  %b   | 0000, cout=1", a, b, cin, sum, cout);
        
        // Test 15: Random test case
        a = 16'h1234; b = 16'h5678; cin = 1'b0; #1
        $display(" 15  |  %04h   |  %04h   |  %b  |   %04h    |  %b   | 68AC", a, b, cin, sum, cout);
        
        // Test 16: Random test case with carry
        a = 16'h1234; b = 16'h5678; cin = 1'b1; #1
        $display(" 16  |  %04h   |  %04h   |  %b  |   %04h    |  %b   | 68AD", a, b, cin, sum, cout);
        
        $display("-----|---------|---------|-----|-----------|------|----------");
        $display("Testbench completed.");
        
        #1 $finish;
    end
    
endmodule
