module DFF(input wire clk,input wire d, output reg q);
       initial q = 0;
       always @(posedge clk) begin
	   q <= d;
       end
endmodule

