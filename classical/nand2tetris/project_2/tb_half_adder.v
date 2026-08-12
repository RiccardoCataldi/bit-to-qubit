`timescale 1ns/1ps
module tb_half_adder;
  reg a, b;
  wire s, c;

  half_adder dut(.a(a), .b(b), .s(s), .c(c));

  initial begin
    $dumpfile("half_adder.vcd");
    $dumpvars(0, tb_half_adder);

    $display("a b | s c");
    a=0; b=0; #1 $display("%b %b | %b %b", a, b, s, c);
    a=0; b=1; #1 $display("%b %b | %b %b", a, b, s, c);
    a=1; b=0; #1 $display("%b %b | %b %b", a, b, s, c);
    a=1; b=1; #1 $display("%b %b | %b %b", a, b, s, c);
    #1 $finish;
  end
endmodule
