`timescale 1ns/1ps

module tb_inc16;
    reg [15:0] a;
    wire [15:0] y;
    
    // Instantiate the 16-bit increment module
    inc16 dut(.a(a), .y(y));
    
    initial begin
        // Setup VCD dump for waveform viewing
        $dumpfile("inc16.vcd");
        $dumpvars(0, tb_inc16);
        
        // Display header
        $display("Test | Input a (hex) | Output y (hex) | Expected | Status");
        $display("-----|---------------|----------------|----------|--------");
        
        // Test 1: Basic increment from 0
        a = 16'h0000; #1
        $display("  1  |     %04h      |     %04h       |   0001   | %s", 
                 a, y, (y == 16'h0001) ? "PASS" : "FAIL");
        
        // Test 2: Basic increment from 1
        a = 16'h0001; #1
        $display("  2  |     %04h      |     %04h       |   0002   | %s", 
                 a, y, (y == 16'h0002) ? "PASS" : "FAIL");
        
        // Test 3: Basic increment from 2
        a = 16'h0002; #1
        $display("  3  |     %04h      |     %04h       |   0003   | %s", 
                 a, y, (y == 16'h0003) ? "PASS" : "FAIL");
        
        // Test 4: Carry to next nibble
        a = 16'h000F; #1
        $display("  4  |     %04h      |     %04h       |   0010   | %s", 
                 a, y, (y == 16'h0010) ? "PASS" : "FAIL");
        
        // Test 5: Carry to next byte
        a = 16'h00FF; #1
        $display("  5  |     %04h      |     %04h       |   0100   | %s", 
                 a, y, (y == 16'h0100) ? "PASS" : "FAIL");
        
        // Test 6: Multiple carry propagation
        a = 16'h0FFF; #1
        $display("  6  |     %04h      |     %04h       |   1000   | %s", 
                 a, y, (y == 16'h1000) ? "PASS" : "FAIL");
        
        // Test 7: Random test case
        a = 16'h1234; #1
        $display("  7  |     %04h      |     %04h       |   1235   | %s", 
                 a, y, (y == 16'h1235) ? "PASS" : "FAIL");
        
        // Test 8: Bit pattern test
        a = 16'h5555; #1
        $display("  8  |     %04h      |     %04h       |   5556   | %s", 
                 a, y, (y == 16'h5556) ? "PASS" : "FAIL");
        
        // Test 9: Alternating bits
        a = 16'hAAAA; #1
        $display("  9  |     %04h      |     %04h       |   AAAB   | %s", 
                 a, y, (y == 16'hAAAB) ? "PASS" : "FAIL");
        
        // Test 10: Near maximum value
        a = 16'hFFFE; #1
        $display(" 10  |     %04h      |     %04h       |   FFFF   | %s", 
                 a, y, (y == 16'hFFFF) ? "PASS" : "FAIL");
        
        // Test 11: Maximum value (overflow case)
        a = 16'hFFFF; #1
        $display(" 11  |     %04h      |     %04h       |   0000   | %s", 
                 a, y, (y == 16'h0000) ? "PASS" : "FAIL");
        
        // Test 12: Powers of 2 minus 1
        a = 16'h00FF; #1
        $display(" 12  |     %04h      |     %04h       |   0100   | %s", 
                 a, y, (y == 16'h0100) ? "PASS" : "FAIL");
        
        // Test 13: More carry propagation
        a = 16'h07FF; #1
        $display(" 13  |     %04h      |     %04h       |   0800   | %s", 
                 a, y, (y == 16'h0800) ? "PASS" : "FAIL");
        
        // Test 14: High bit set
        a = 16'h8000; #1
        $display(" 14  |     %04h      |     %04h       |   8001   | %s", 
                 a, y, (y == 16'h8001) ? "PASS" : "FAIL");
        
        // Test 15: Another random case
        a = 16'hABCD; #1
        $display(" 15  |     %04h      |     %04h       |   ABCE   | %s", 
                 a, y, (y == 16'hABCE) ? "PASS" : "FAIL");
        
        // Test 16: Edge case before overflow
        a = 16'hFFFE; #1
        $display(" 16  |     %04h      |     %04h       |   FFFF   | %s", 
                 a, y, (y == 16'hFFFF) ? "PASS" : "FAIL");
        
        $display("-----|---------------|----------------|----------|--------");
        
        // Summary
        $display("Key test cases:");
        $display("- Basic increments: Tests 1-3");
        $display("- Carry propagation: Tests 4-6, 12-13");  
        $display("- Bit patterns: Tests 8-9");
        $display("- Overflow case: Test 11 (FFFF -> 0000)");
        $display("- Edge cases: Tests 10, 16");
        
        $display("Testbench completed.");
        
        #1 $finish;
    end
    
endmodule
