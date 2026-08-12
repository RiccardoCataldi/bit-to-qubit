module and2(input a, input b, output y);
  wire nand_out;
  nand2 u0 (.a(a), .b(b), .y(nand_out));
  not2 u1 (.a(nand_out), .y(y));  // AND = NOT(NAND)
endmodule
