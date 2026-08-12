`timescale 1ns/1ps
module tb_and2;
  reg a, b;
  wire y;

  and2 dut(.a(a), .b(b), .y(y));

  initial begin
    $dumpfile("and2.vcd");
    $dumpvars(0, tb_and2);

    $display("a b | y");
    a=0; b=0; #1 $display("%b %b | %b", a, b, y);
    a=0; b=1; #1 $display("%b %b | %b", a, b, y);
    a=1; b=0; #1 $display("%b %b | %b", a, b, y);
    a=1; b=1; #1 $display("%b %b | %b", a, b, y);
    #1 $finish;
  end
endmodule
