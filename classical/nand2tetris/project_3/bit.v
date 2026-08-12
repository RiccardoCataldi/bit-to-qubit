module bit(input wire clk, input wire load, input wire in, output wire out);
    wire mux_out;
    
    mux2_1 mux2_1(.a(out),.b(in),.c(load),.y(mux_out));
    DFF dff(.clk(clk),.d(mux_out),.q(out));

endmodule