module ram8(
    input wire clk,
    input wire load, 
    input wire [15:0] in,
    input wire[2:0] address,
    output wire [15:0] out
);
    wire load0, load1, load2, load3, load4, load5, load6, load7;
    wire  [15:0] r0, r1, r2, r3, r4, r5, r6, r7;
    DMux8Way wsel(.in(load), .sel(address), .a(load0), .b(load1), .c(load2), .d(load3), .e(load4), .f(load5), .g(load6), .h(load7));
    register16 reg0(.clk(clk), .load(load0), .in(in), .out(r0));
    register16 reg1(.clk(clk), .load(load1), .in(in), .out(r1));
    register16 reg2(.clk(clk), .load(load2), .in(in), .out(r2));
    register16 reg3(.clk(clk), .load(load3), .in(in), .out(r3));
    register16 reg4(.clk(clk), .load(load4), .in(in), .out(r4));
    register16 reg5(.clk(clk), .load(load5), .in(in), .out(r5));
    register16 reg6(.clk(clk), .load(load6), .in(in), .out(r6));
    register16 reg7(.clk(clk), .load(load7), .in(in), .out(r7));
    mux8way16 rsel(.a(r0), .b(r1), .c(r2), .d(r3), .e(r4), .f(r5), .g(r6), .h(r7), .sel(address), .out(out));
endmodule

