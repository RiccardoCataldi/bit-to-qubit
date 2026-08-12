module not2(input a, output y);
  nand2 u0 (.a(a), .b(a), .y(y));  // NOT is NAND with tied inputs
endmodule
