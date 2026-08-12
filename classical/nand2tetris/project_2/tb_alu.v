module tb_alu();
    // Testbench signals
    reg [15:0] x, y;
    reg zx, nx, zy, ny, f, no;
    wire [15:0] out;
    wire zr, ng;
    
    // Instantiate ALU
    alu uut (
        .x(x), .y(y),
        .zx(zx), .nx(nx), .zy(zy), .ny(ny), .f(f), .no(no),
        .out(out), .zr(zr), .ng(ng)
    );
    
    // Test counter
    integer test_num = 0;
    
    // Task to display test results
    task display_test;
        input [6*8:1] function_name;
        input [15:0] expected_out;
        input expected_zr, expected_ng;
        begin
            test_num = test_num + 1;
            $display("Test %2d: %s", test_num, function_name);
            $display("  Inputs:  x=%h, y=%h, zx=%b, nx=%b, zy=%b, ny=%b, f=%b, no=%b", 
                     x, y, zx, nx, zy, ny, f, no);
            $display("  Output:  out=%h (expected %h) %s", 
                     out, expected_out, (out == expected_out) ? "✓" : "✗");
            $display("  Flags:   zr=%b (expected %b) %s, ng=%b (expected %b) %s", 
                     zr, expected_zr, (zr == expected_zr) ? "✓" : "✗",
                     ng, expected_ng, (ng == expected_ng) ? "✓" : "✗");
            $display("  Status:  %s", 
                     (out == expected_out && zr == expected_zr && ng == expected_ng) ? "PASS" : "FAIL");
            $display("");
        end
    endtask
    
    initial begin
        $display("=== ALU Testbench ===");
        $display("Testing all 18 ALU functions with x=15, y=3");
        $display("");
        
        // Set test inputs
        x = 16'h000F;  // x = 15
        y = 16'h0003;  // y = 3
        
        // Wait for signals to settle
        #10;
        
        // Test 1: 0 (zero)
        {zx,nx,zy,ny,f,no} = 6'b101010;
        #10;
        display_test("0", 16'h0000, 1'b1, 1'b0);
        
        // Test 2: 1 (one)  
        {zx,nx,zy,ny,f,no} = 6'b111111;
        #10;
        display_test("1", 16'h0001, 1'b0, 1'b0);
        
        // Test 3: -1 (negative one)
        {zx,nx,zy,ny,f,no} = 6'b111010;
        #10;
        display_test("-1", 16'hFFFF, 1'b0, 1'b1);
        
        // Test 4: x
        {zx,nx,zy,ny,f,no} = 6'b001100;
        #10;
        display_test("x", 16'h000F, 1'b0, 1'b0);
        
        // Test 5: y
        {zx,nx,zy,ny,f,no} = 6'b110000;
        #10;
        display_test("y", 16'h0003, 1'b0, 1'b0);
        
        // Test 6: !x (not x)
        {zx,nx,zy,ny,f,no} = 6'b001101;
        #10;
        display_test("!x", 16'hFFF0, 1'b0, 1'b1);
        
        // Test 7: !y (not y)
        {zx,nx,zy,ny,f,no} = 6'b110001;
        #10;
        display_test("!y", 16'hFFFC, 1'b0, 1'b1);
        
        // Test 8: -x (negative x)
        {zx,nx,zy,ny,f,no} = 6'b001111;
        #10;
        display_test("-x", 16'hFFF1, 1'b0, 1'b1);
        
        // Test 9: -y (negative y)
        {zx,nx,zy,ny,f,no} = 6'b110011;
        #10;
        display_test("-y", 16'hFFFD, 1'b0, 1'b1);
        
        // Test 10: x+1
        {zx,nx,zy,ny,f,no} = 6'b011111;
        #10;
        display_test("x+1", 16'h0010, 1'b0, 1'b0);
        
        // Test 11: y+1
        {zx,nx,zy,ny,f,no} = 6'b110111;
        #10;
        display_test("y+1", 16'h0004, 1'b0, 1'b0);
        
        // Test 12: x-1
        {zx,nx,zy,ny,f,no} = 6'b001110;
        #10;
        display_test("x-1", 16'h000E, 1'b0, 1'b0);
        
        // Test 13: y-1
        {zx,nx,zy,ny,f,no} = 6'b110010;
        #10;
        display_test("y-1", 16'h0002, 1'b0, 1'b0);
        
        // Test 14: x+y
        {zx,nx,zy,ny,f,no} = 6'b000010;
        #10;
        display_test("x+y", 16'h0012, 1'b0, 1'b0);
        
        // Test 15: x-y
        {zx,nx,zy,ny,f,no} = 6'b010011;
        #10;
        display_test("x-y", 16'h000C, 1'b0, 1'b0);
        
        // Test 16: y-x
        {zx,nx,zy,ny,f,no} = 6'b000111;
        #10;
        display_test("y-x", 16'hFFF4, 1'b0, 1'b1);
        
        // Test 17: x&y
        {zx,nx,zy,ny,f,no} = 6'b000000;
        #10;
        display_test("x&y", 16'h0003, 1'b0, 1'b0);
        
        // Test 18: x|y
        {zx,nx,zy,ny,f,no} = 6'b010101;
        #10;
        display_test("x|y", 16'h000F, 1'b0, 1'b0);
        
        $display("=== Additional Edge Case Tests ===");
        $display("");
        
        // Test with zero inputs
        x = 16'h0000; y = 16'h0000;
        {zx,nx,zy,ny,f,no} = 6'b000010; // x+y
        #10;
        display_test("0+0", 16'h0000, 1'b1, 1'b0);
        
        // Test with negative inputs
        x = 16'hFFFF; y = 16'hFFFE; // x=-1, y=-2
        {zx,nx,zy,ny,f,no} = 6'b000010; // x+y  
        #10;
        display_test("(-1)+(-2)", 16'hFFFD, 1'b0, 1'b1);
        
        // Test overflow case
        x = 16'h7FFF; y = 16'h0001; // x=32767, y=1
        {zx,nx,zy,ny,f,no} = 6'b000010; // x+y (should overflow to negative)
        #10;
        display_test("32767+1", 16'h8000, 1'b0, 1'b1);
        
        $display("=== Testbench Complete ===");
        $finish;
    end
    
    // Monitor changes
    initial begin
        $monitor("Time=%0t: x=%h y=%h | zx=%b nx=%b zy=%b ny=%b f=%b no=%b | out=%h zr=%b ng=%b", 
                 $time, x, y, zx, nx, zy, ny, f, no, out, zr, ng);
    end
    
endmodule
