module ram16k(
    input wire clk,
    input wire load,
    input wire [15:0] in,
    input wire [13:0] address,
    output wire [15:0] out
);
    wire load0, load1, load2, load3;
    wire [15:0] r0, r1, r2, r3;

    DMux4Way wsel(
        .in(load),
        .sel(address[13:12]),
        .a(load0), .b(load1), .c(load2), .d(load3)
    );

    ram4k bank0(.clk(clk), .load(load0), .in(in), .address(address[11:0]), .out(r0));
    ram4k bank1(.clk(clk), .load(load1), .in(in), .address(address[11:0]), .out(r1));
    ram4k bank2(.clk(clk), .load(load2), .in(in), .address(address[11:0]), .out(r2));
    ram4k bank3(.clk(clk), .load(load3), .in(in), .address(address[11:0]), .out(r3));

    mux4way16 rsel(
        .a(r0), .b(r1), .c(r2), .d(r3),
        .sel(address[13:12]),
        .out(out)
    );
endmodule
