module tb_not16;
  reg [15:0] x;
  wire [15:0] y;
  not16 dut(.in(x), .out(y));
  initial begin 
    $dumpfile("not16.vcd");
    $dumpvars(0, tb_not16);
    $display("x | y");
    x = 16'h0000; #1 $display("%h | %h", x, y);  // All zeros
    x = 16'hFFFF; #1 $display("%h | %h", x, y);  // All ones  
    x = 16'hAAAA; #1 $display("%h | %h", x, y);  // Alternating 1010...
    #1 $finish;
  end
endmodule
