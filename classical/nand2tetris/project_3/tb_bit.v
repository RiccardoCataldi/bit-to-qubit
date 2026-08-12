`timescale 1ns/1ps

module bit_tb;
    reg clk, load, in;
    wire out;
    
    // Instantiate the bit module
    bit uut (.clk(clk), .load(load), .in(in), .out(out));
    
    // Generate clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns period
    end
    
    // Test sequence
    initial begin
        // Initialize
        load = 0;
        in = 0;
        
        // Wait and observe
        #15;
        $display("Time=%0t load=%b in=%b out=%b", $time, load, in, out);
        
        // Test 1: Load a 1
        load = 1;
        in = 1;
        #10;
        $display("Time=%0t load=%b in=%b out=%b (expect out=1)", $time, load, in, out);
        
        // Test 2: Keep the 1 (load=0)
        load = 0;
        in = 0;
        #10;
        $display("Time=%0t load=%b in=%b out=%b (expect out=1)", $time, load, in, out);
        
        // Test 3: Load a 0
        load = 1;
        in = 0;
        #10;
        $display("Time=%0t load=%b in=%b out=%b (expect out=0)", $time, load, in, out);
        
        // Test 4: Keep the 0
        load = 0;
        in = 1;
        #10;
        $display("Time=%0t load=%b in=%b out=%b (expect out=0)", $time, load, in, out);
        
        #20;
        $finish;
    end
    
    // Waveform dump
    initial begin
        $dumpfile("bit.vcd");
        $dumpvars(0, bit_tb);
    end
    
endmodule