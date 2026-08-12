`timescale 1ns/1ps

module tb_full_adder;
  reg a, b, cin;
  wire sum, cout;
  
  // Instantiate the full adder
  full_adder dut(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));
  
  initial begin
    // Setup VCD dump for waveform viewing
    $dumpfile("full_adder.vcd");
    $dumpvars(0, tb_full_adder);
    
    // Display header
    $display("a b cin | sum cout");
    $display("--------|----------");
    
    // Test all 8 possible input combinations
    a=0; b=0; cin=0; #1 $display("%b %b  %b  |  %b   %b", a, b, cin, sum, cout);
    a=0; b=0; cin=1; #1 $display("%b %b  %b  |  %b   %b", a, b, cin, sum, cout);
    a=0; b=1; cin=0; #1 $display("%b %b  %b  |  %b   %b", a, b, cin, sum, cout);
    a=0; b=1; cin=1; #1 $display("%b %b  %b  |  %b   %b", a, b, cin, sum, cout);
    a=1; b=0; cin=0; #1 $display("%b %b  %b  |  %b   %b", a, b, cin, sum, cout);
    a=1; b=0; cin=1; #1 $display("%b %b  %b  |  %b   %b", a, b, cin, sum, cout);
    a=1; b=1; cin=0; #1 $display("%b %b  %b  |  %b   %b", a, b, cin, sum, cout);
    a=1; b=1; cin=1; #1 $display("%b %b  %b  |  %b   %b", a, b, cin, sum, cout);
    
    #1 $finish;
  end
  
endmodule
