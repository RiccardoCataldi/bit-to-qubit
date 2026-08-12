`timescale 1ns/1ps
module tb_nand2;
  reg a, b;
  wire y;

  nand2 dut(.a(a), .b(b), .y(y));

  initial begin
    $dumpfile("nand2.vcd");
    $dumpvars(0, tb_nand2);

    $display("a b | y");
    a=0; b=0; #1 $display("%b %b | %b", a, b, y);
    a=0; b=1; #1 $display("%b %b | %b", a, b, y);
    a=1; b=0; #1 $display("%b %b | %b", a, b, y);
    a=1; b=1; #1 $display("%b %b | %b", a, b, y);
    #1 $finish;
  end
endmodule
