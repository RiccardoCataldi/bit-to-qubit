module full_adder(input a, input b, input cin, output sum, output cout);
  
  wire s1, c1, c2;  // intermediate signals
  
  // First half adder: adds a and b
  half_adder ha1 (.a(a), .b(b), .s(s1), .c(c1));
  
  // Second half adder: adds result from first HA with carry-in
  half_adder ha2 (.a(s1), .b(cin), .s(sum), .c(c2));
  
  // OR gate: combines carry outputs from both half adders
  or2 u0 (.a(c1), .b(c2), .y(cout));
  
endmodule
