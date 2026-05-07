`timescale 1ns/1ps

module tb_register16;
    reg clk, load;
    reg [15:0] in;
    wire [15:0] out;
    
    // Instantiate register16
    register16 uut(.clk(clk), .load(load), .in(in), .out(out));
    
    // Generate clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns period
    end
    
    // Test sequence
    initial begin
        // Initialize
        load = 0;
        in = 16'h0000;
        
        #15;
        $display("Time=%0t load=%b in=%h out=%h", $time, load, in, out);
        
        // Test 1: Load a value
        load = 1;
        in = 16'hA5A5;
        #11;
        $display("Time=%0t load=%b in=%h out=%h (expect out=A5A5)", $time, load, in, out);
        
        // Test 2: Hold value when load=0
        load = 0;
        in = 16'h1234;
        #11;
        $display("Time=%0t load=%b in=%h out=%h (expect out=A5A5)", $time, load, in, out);
        
        // Test 3: Load another value
        load = 1;
        in = 16'h0F0F;
        #11;
        $display("Time=%0t load=%b in=%h out=%h (expect out=0F0F)", $time, load, in, out);
        
        // Test 4: Hold again
        load = 0;
        in = 16'hFFFF;
        #11;
        $display("Time=%0t load=%b in=%h out=%h (expect out=0F0F)", $time, load, in, out);
        
        #20;
        $finish;
    end
    
    // Waveform dump
    initial begin
        $dumpfile("register16.vcd");
        $dumpvars(0, tb_register16);
    end
    
endmodule
