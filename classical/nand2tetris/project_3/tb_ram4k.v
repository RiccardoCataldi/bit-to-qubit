`timescale 1ns/1ps

module tb_ram4k;
    reg clk, load;
    reg [15:0] in;
    reg [11:0] address;
    wire [15:0] out;
    integer fails;

    ram4k uut (.clk(clk), .load(load), .in(in), .address(address), .out(out));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        fails = 0;
        load = 0;
        in = 16'h0000;
        address = 12'd0;

        #15;

        load = 1;
        address = 12'd0;
        in = 16'hB000;
        #11;
        address = 12'd511;
        in = 16'hB1FF;
        #11;
        address = 12'd512;
        in = 16'hB200;
        #11;
        address = 12'd4095;
        in = 16'hBFFF;
        #11;

        load = 0;
        address = 12'd0;
        #1;
        if (out !== 16'hB000) begin $display("FAIL addr0 got %h", out); fails = fails + 1; end
        address = 12'd511;
        #1;
        if (out !== 16'hB1FF) begin $display("FAIL addr511 got %h", out); fails = fails + 1; end
        address = 12'd512;
        #1;
        if (out !== 16'hB200) begin $display("FAIL addr512 got %h", out); fails = fails + 1; end
        address = 12'd4095;
        #1;
        if (out !== 16'hBFFF) begin $display("FAIL addr4095 got %h", out); fails = fails + 1; end
        address = 12'd1;
        #1;
        if (out !== 16'h0000) begin $display("FAIL addr1 got %h expect 0", out); fails = fails + 1; end

        if (fails == 0) $display("PASS ram4k");
        else $display("FAIL ram4k (%0d)", fails);
        $finish;
    end
endmodule
