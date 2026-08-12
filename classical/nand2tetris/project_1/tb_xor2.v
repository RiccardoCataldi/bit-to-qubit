module tb_xor2;
  reg a, b;
  wire y;
  xor2 dut(.a(a), .b(b), .y(y));
  initial begin
    $dumpfile("xor2.vcd");
    $dumpvars(0, tb_xor2);
    $display("a b | y");
    a=0; b=0; #1 $display("%b %b | %b", a, b, y);
    a=0; b=1; #1 $display("%b %b | %b", a, b, y);
    a=1; b=0; #1 $display("%b %b | %b", a, b, y);
    a=1; b=1; #1 $display("%b %b | %b", a, b, y);
    #1 $finish;
  end
endmodule