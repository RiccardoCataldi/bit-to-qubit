module mux2_1(input a, input b, input c, output y);
  wire notc, notb, n1, n2;  
  
  not2 u0(.a(c), .y(notc));         
  and2 u1(.a(a), .b(notc), .y(n1)); 
  and2 u2(.a(b), .b(c), .y(n2));
  or2  u3(.a(n1), .b(n2), .y(y));

endmodule
