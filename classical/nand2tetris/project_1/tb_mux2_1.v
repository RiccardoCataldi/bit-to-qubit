module tb_mux2_1;
  reg a, b, c;
  wire y;
  mux2_1 dut(.a(a), .b(b), .c(c), .y(y));
  initial begin
    $dumpfile("mux2_1.vcd");
    $dumpvars(0, tb_mux2_1);
    $display("a b c | y");
    a=0; b=0; c=0; #1 $display("%b %b %b | %b", a, b, c, y);
    a=0; b=1; c=0; #1 $display("%b %b %b | %b", a, b, c, y);
    a=1; b=0; c=0; #1 $display("%b %b %b | %b", a, b, c, y);
    a=1; b=1; c=0; #1 $display("%b %b %b | %b", a, b, c, y);
    a=0; b=0; c=1; #1 $display("%b %b %b | %b", a, b, c, y);
    a=0; b=1; c=1; #1 $display("%b %b %b | %b", a, b, c, y);
    a=1; b=0; c=1; #1 $display("%b %b %b | %b", a, b, c, y);
    a=1; b=1; c=1; #1 $display("%b %b %b | %b", a, b, c, y);
    #1 $finish;
  end
endmodule
