module ram4k(
    input wire clk,
    input wire load,
    input wire [15:0] in,
    input wire [11:0] address,
    output wire [15:0] out
);
    wire load0, load1, load2, load3, load4, load5, load6, load7;
    wire [15:0] r0, r1, r2, r3, r4, r5, r6, r7;

    DMux8Way wsel(
        .in(load),
        .sel(address[11:9]),
        .a(load0), .b(load1), .c(load2), .d(load3),
        .e(load4), .f(load5), .g(load6), .h(load7)
    );

    ram512 bank0(.clk(clk), .load(load0), .in(in), .address(address[8:0]), .out(r0));
    ram512 bank1(.clk(clk), .load(load1), .in(in), .address(address[8:0]), .out(r1));
    ram512 bank2(.clk(clk), .load(load2), .in(in), .address(address[8:0]), .out(r2));
    ram512 bank3(.clk(clk), .load(load3), .in(in), .address(address[8:0]), .out(r3));
    ram512 bank4(.clk(clk), .load(load4), .in(in), .address(address[8:0]), .out(r4));
    ram512 bank5(.clk(clk), .load(load5), .in(in), .address(address[8:0]), .out(r5));
    ram512 bank6(.clk(clk), .load(load6), .in(in), .address(address[8:0]), .out(r6));
    ram512 bank7(.clk(clk), .load(load7), .in(in), .address(address[8:0]), .out(r7));

    mux8way16 rsel(
        .a(r0), .b(r1), .c(r2), .d(r3), .e(r4), .f(r5), .g(r6), .h(r7),
        .sel(address[11:9]),
        .out(out)
    );
endmodule
