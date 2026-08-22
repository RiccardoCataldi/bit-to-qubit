`timescale 1ns/1ps

module tb_pc;
    reg clk, load, inc, reset;
    reg [15:0] in;
    wire [15:0] out;
    integer fails;

    pc uut (.clk(clk), .load(load), .inc(inc), .reset(reset), .in(in), .out(out));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        fails = 0;
        load = 0;
        inc = 0;
        reset = 0;
        in = 16'h0000;

        #15;
        if (out !== 16'h0000) begin $display("FAIL init got %h", out); fails = fails + 1; end

        inc = 1;
        #11;
        if (out !== 16'h0001) begin $display("FAIL inc1 got %h", out); fails = fails + 1; end
        #10;
        if (out !== 16'h0002) begin $display("FAIL inc2 got %h", out); fails = fails + 1; end
        #10;
        if (out !== 16'h0003) begin $display("FAIL inc3 got %h", out); fails = fails + 1; end

        inc = 0;
        load = 1;
        in = 16'h00C8;
        #11;
        if (out !== 16'h00C8) begin $display("FAIL load got %h", out); fails = fails + 1; end

        load = 0;
        inc = 1;
        in = 16'hFFFF;
        #11;
        if (out !== 16'h00C9) begin $display("FAIL inc after load got %h", out); fails = fails + 1; end

        reset = 1;
        load = 1;
        inc = 1;
        in = 16'h1234;
        #11;
        if (out !== 16'h0000) begin $display("FAIL reset wins got %h", out); fails = fails + 1; end

        reset = 0;
        load = 1;
        inc = 1;
        in = 16'h00AA;
        #11;
        if (out !== 16'h00AA) begin $display("FAIL load over inc got %h", out); fails = fails + 1; end

        load = 0;
        inc = 0;
        in = 16'h1111;
        #11;
        if (out !== 16'h00AA) begin $display("FAIL hold got %h", out); fails = fails + 1; end

        if (fails == 0) $display("PASS pc");
        else $display("FAIL pc (%0d)", fails);
        $finish;
    end
endmodule
