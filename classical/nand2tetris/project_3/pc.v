module pc(
    input wire clk,
    input wire load,
    input wire inc,
    input wire reset,
    input wire [15:0] in,
    output wire [15:0] out
);
    wire [15:0] plusone, hold_or_inc, load_out, next;

    inc16 adder(.a(out), .y(plusone));
    mux16 m_inc(.a(out), .b(plusone), .s(inc), .y(hold_or_inc));
    mux16 m_load(.a(hold_or_inc), .b(in), .s(load), .y(load_out));
    mux16 m_reset(.a(load_out), .b(16'b0), .s(reset), .y(next));
    register16 r(.clk(clk), .load(1'b1), .in(next), .out(out));
endmodule
