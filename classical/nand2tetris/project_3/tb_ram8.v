`timescale 1ns/1ps

module tb_ram8;
    reg clk, load;
    reg [15:0] in;
    reg [2:0] address;
    wire [15:0] out;

    ram8 uut (.clk(clk), .load(load), .in(in), .address(address), .out(out));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        load = 0;
        in = 16'h0000;
        address = 3'd0;

        #15;
        $display("Time=%0t init out=%h", $time, out);

        // Isolation: only register 5 gets a value; others stay 0
        address = 3'd5;
        load = 1;
        in = 16'hDEAD;
        #11;
        if (out !== 16'hDEAD) $display("FAIL after write reg5: out=%h", out);
        else $display("Time=%0t wrote reg5, out=%h (expect DEAD)", $time, out);

        load = 0;
        address = 3'd0;
        #1;
        if (out !== 16'h0000) $display("FAIL read reg0: out=%h expect 0", out);
        else $display("Time=%0t read reg0 out=%h (expect 0)", $time, out);

        address = 3'd5;
        #1;
        if (out !== 16'hDEAD) $display("FAIL read reg5: out=%h", out);
        else $display("Time=%0t read reg5 out=%h (expect DEAD)", $time, out);

        // Fill all registers with distinct values
        load = 1;
        address = 3'd0;
        in = 16'h0100;
        #11;
        address = 3'd1;
        in = 16'h0201;
        #11;
        address = 3'd2;
        in = 16'h0302;
        #11;
        address = 3'd3;
        in = 16'h0403;
        #11;
        address = 3'd4;
        in = 16'h0504;
        #11;
        address = 3'd5;
        in = 16'h0605;
        #11;
        address = 3'd6;
        in = 16'h0706;
        #11;
        address = 3'd7;
        in = 16'h0807;
        #11;

        // Read back without loading
        load = 0;

        address = 3'd0;
        #1;
        if (out !== 16'h0100) $display("FAIL reg0: got %h", out);
        else $display("Time=%0t read reg0 out=%h ok", $time, out);
        address = 3'd1;
        #1;
        if (out !== 16'h0201) $display("FAIL reg1: got %h", out);
        else $display("Time=%0t read reg1 out=%h ok", $time, out);
        address = 3'd2;
        #1;
        if (out !== 16'h0302) $display("FAIL reg2: got %h", out);
        else $display("Time=%0t read reg2 out=%h ok", $time, out);
        address = 3'd3;
        #1;
        if (out !== 16'h0403) $display("FAIL reg3: got %h", out);
        else $display("Time=%0t read reg3 out=%h ok", $time, out);
        address = 3'd4;
        #1;
        if (out !== 16'h0504) $display("FAIL reg4: got %h", out);
        else $display("Time=%0t read reg4 out=%h ok", $time, out);
        address = 3'd5;
        #1;
        if (out !== 16'h0605) $display("FAIL reg5: got %h", out);
        else $display("Time=%0t read reg5 out=%h ok", $time, out);
        address = 3'd6;
        #1;
        if (out !== 16'h0706) $display("FAIL reg6: got %h", out);
        else $display("Time=%0t read reg6 out=%h ok", $time, out);
        address = 3'd7;
        #1;
        if (out !== 16'h0807) $display("FAIL reg7: got %h", out);
        else $display("Time=%0t read reg7 out=%h ok", $time, out);

        #20;
        $finish;
    end

    initial begin
        $dumpfile("ram8.vcd");
        $dumpvars(0, tb_ram8);
    end
endmodule
