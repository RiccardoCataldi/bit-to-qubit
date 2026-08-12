`timescale 1ns/1ps
module tb_not2;
  reg a;
  wire y;

  not2 dut(.a(a), .y(y));

  initial begin
    $dumpfile("not2.vcd");
    $dumpvars(0, tb_not2);

    $display("a | y");
    a=0; #1 $display("%b | %b", a, y);
    a=1; #1 $display("%b | %b", a, y);
    #1 $finish;
  end
endmodule
