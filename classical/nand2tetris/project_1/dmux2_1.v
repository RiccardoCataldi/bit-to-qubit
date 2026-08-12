module dmux1_2(input x, input s, output y, output z);
  wire nots;  // wire for ~s
  
  not2 u0(.a(s), .y(nots));        // Create ~s
  and2 u1(.a(x), .b(nots), .y(y)); // y = x * ~s  
  and2 u2(.a(x), .b(s), .y(z));    // z = x * s
endmodule
