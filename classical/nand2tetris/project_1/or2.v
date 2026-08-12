module or2(input a, input b, output y);
  wire na, nb;
  not2 u0 (.a(a), .y(na));
  not2 u1 (.a(b), .y(nb));
  nand2 u2 (.a(na), .b(nb), .y(y)); // OR = NAND(NOT a, NOT b)
endmodule
