module xor2(input a, input b, output y);
  wire nota, notb, n2, n4;  // Dichiarazione corretta dei wire
  
  not2 u0(.a(a), .y(nota));         // NOT a
  not2 u1(.a(b), .y(notb));         // NOT b  
  and2 u2(.a(nota), .b(b), .y(n2)); // nota AND b
  and2 u3(.a(a), .b(notb), .y(n4)); // a AND notb
  or2  u4(.a(n2), .b(n4), .y(y));   // Final OR
endmodule
