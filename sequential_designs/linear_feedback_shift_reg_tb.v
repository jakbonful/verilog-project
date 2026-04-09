`timescale 1us/1ns
module lfsr_16_tb ();
    // testbench variables
    reg clk = 0;
    reg enable;
    reg reset_n;
    wire [15:0] lfsr;

    // instantiate DUT
    lfsr_16 TEST1 (
        .clk(clk),
        .reset_n(reset_n),
        .enable(enable),
        .lfsr(lfsr)
    );

    // clk generation
    always begin
        #0.5 clk = ~clk;
    end

    // monitor
    initial begin
        $monitor($time, " enable = %d, lfsr = 0x%x",    
                            enable, lfsr);
    end
    // stimulus 
    initial begin
        #1;
        reset_n = 0; enable = 0; // load 
        #1;
        reset_n = 1; // release load and shift

        repeat (2) @(posedge clk); 
        enable = 1;

        repeat (20) @(posedge clk);
        enable = 0;
    end

    // stop simulator
    initial begin
        #30 $stop;
    end
endmodule