module half_adder(input a, input b, output s, output c);
  xor2 u0 (.a(a), .b(b), .y(s));
  and2 u1 (.a(a), .b(b), .y(c));
endmodule
