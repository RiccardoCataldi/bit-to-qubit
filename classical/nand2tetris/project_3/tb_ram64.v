`timescale 1ns/1ps

module tb_ram64;
    reg clk, load;
    reg [15:0] in;
    reg [5:0] address;
    wire [15:0] out;
    integer fails;

    ram64 uut (.clk(clk), .load(load), .in(in), .address(address), .out(out));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        fails = 0;
        load = 0;
        in = 16'h0000;
        address = 6'd0;

        #15;

        address = 6'd0;
        load = 1;
        in = 16'h1111;
        #11;
        address = 6'd7;
        in = 16'h2222;
        #11;
        address = 6'd8;
        in = 16'h3333;
        #11;
        address = 6'd63;
        in = 16'h4444;
        #11;

        load = 0;
        address = 6'd0;
        #1;
        if (out !== 16'h1111) begin $display("FAIL addr0 got %h", out); fails = fails + 1; end
        address = 6'd7;
        #1;
        if (out !== 16'h2222) begin $display("FAIL addr7 got %h", out); fails = fails + 1; end
        address = 6'd8;
        #1;
        if (out !== 16'h3333) begin $display("FAIL addr8 got %h", out); fails = fails + 1; end
        address = 6'd63;
        #1;
        if (out !== 16'h4444) begin $display("FAIL addr63 got %h", out); fails = fails + 1; end
        address = 6'd1;
        #1;
        if (out !== 16'h0000) begin $display("FAIL addr1 got %h expect 0", out); fails = fails + 1; end

        if (fails == 0) $display("PASS ram64");
        else $display("FAIL ram64 (%0d)", fails);
        $finish;
    end
endmodule
