module tb_dmux1_2;
  reg x, s;
  wire y, z;
  dmux1_2 dut(.x(x), .s(s), .y(y), .z(z));
  initial begin
    $dumpfile("dmux1_2.vcd");
    $dumpvars(0, tb_dmux1_2);
    $display("x s | y z");
    x=0; s=0; #1 $display("%b %b | %b %b", x, s, y, z);
    x=1; s=0; #1 $display("%b %b | %b %b", x, s, y, z);
    x=0; s=1; #1 $display("%b %b | %b %b", x, s, y, z);
    x=1; s=1; #1 $display("%b %b | %b %b", x, s, y, z);
    #1 $finish;
  end
endmodule
