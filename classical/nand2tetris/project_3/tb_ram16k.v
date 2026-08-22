`timescale 1ns/1ps

module tb_ram16k;
    reg clk, load;
    reg [15:0] in;
    reg [13:0] address;
    wire [15:0] out;
    integer fails;

    ram16k uut (.clk(clk), .load(load), .in(in), .address(address), .out(out));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        fails = 0;
        load = 0;
        in = 16'h0000;
        address = 14'd0;

        #15;

        load = 1;
        address = 14'd0;
        in = 16'hC000;
        #11;
        address = 14'd4095;
        in = 16'hCFFF;
        #11;
        address = 14'd4096;
        in = 16'hD000;
        #11;
        address = 14'd16383;
        in = 16'hDFFF;
        #11;

        load = 0;
        address = 14'd0;
        #1;
        if (out !== 16'hC000) begin $display("FAIL addr0 got %h", out); fails = fails + 1; end
        address = 14'd4095;
        #1;
        if (out !== 16'hCFFF) begin $display("FAIL addr4095 got %h", out); fails = fails + 1; end
        address = 14'd4096;
        #1;
        if (out !== 16'hD000) begin $display("FAIL addr4096 got %h", out); fails = fails + 1; end
        address = 14'd16383;
        #1;
        if (out !== 16'hDFFF) begin $display("FAIL addr16383 got %h", out); fails = fails + 1; end
        address = 14'd1;
        #1;
        if (out !== 16'h0000) begin $display("FAIL addr1 got %h expect 0", out); fails = fails + 1; end

        if (fails == 0) $display("PASS ram16k");
        else $display("FAIL ram16k (%0d)", fails);
        $finish;
    end
endmodule
