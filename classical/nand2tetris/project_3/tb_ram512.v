`timescale 1ns/1ps

module tb_ram512;
    reg clk, load;
    reg [15:0] in;
    reg [8:0] address;
    wire [15:0] out;
    integer fails;

    ram512 uut (.clk(clk), .load(load), .in(in), .address(address), .out(out));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        fails = 0;
        load = 0;
        in = 16'h0000;
        address = 9'd0;

        #15;

        load = 1;
        address = 9'd0;
        in = 16'hA000;
        #11;
        address = 9'd63;
        in = 16'hA03F;
        #11;
        address = 9'd64;
        in = 16'hA040;
        #11;
        address = 9'd511;
        in = 16'hA1FF;
        #11;

        load = 0;
        address = 9'd0;
        #1;
        if (out !== 16'hA000) begin $display("FAIL addr0 got %h", out); fails = fails + 1; end
        address = 9'd63;
        #1;
        if (out !== 16'hA03F) begin $display("FAIL addr63 got %h", out); fails = fails + 1; end
        address = 9'd64;
        #1;
        if (out !== 16'hA040) begin $display("FAIL addr64 got %h", out); fails = fails + 1; end
        address = 9'd511;
        #1;
        if (out !== 16'hA1FF) begin $display("FAIL addr511 got %h", out); fails = fails + 1; end
        address = 9'd1;
        #1;
        if (out !== 16'h0000) begin $display("FAIL addr1 got %h expect 0", out); fails = fails + 1; end

        if (fails == 0) $display("PASS ram512");
        else $display("FAIL ram512 (%0d)", fails);
        $finish;
    end
endmodule
