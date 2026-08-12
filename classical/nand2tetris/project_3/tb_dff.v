`timescale 1ns/1ps

module dff2_tb;
    reg clk, d;
    wire q;
    integer i;
    
    DFF uut (.clk(clk), .d(d), .q(q));
    
    // Clock generation
    always #5 clk = ~clk;
    
    initial begin
        // Initialize
        clk = 0;
        d = 0;
        
        $display("Time\tclk\td\tq");
        $display("----\t---\t-\t-");
        
        // Monitor changes
        $monitor("%0t\t%b\t%b\t%b", $time, clk, d, q);
        
        // Test sequence
        #10 d = 1;
        #10 d = 0;
        #10 d = 1;
        #10 d = 1;
        #10 d = 0;
        #20;
        
        $finish;
    end
    
    initial begin
        $dumpfile("dff_waveform.vcd");
        $dumpvars(0, dff2_tb);
    end
    
endmodule
