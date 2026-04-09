`timescale 1us/1ns

module mod_counter_tb ();

    // parameters
    parameter N = 10;
    parameter cnt_width = $clog2(N);

    // testbench signals
    reg clk = 0;
    reg enable = 0;
    reg reset_n = 0;
    wire [cnt_width-1:0] counter_out;

    // clock
    always #0.5 clk = ~clk;

    // DUT
    mod_counter #(.mod_no(N), .counter_width(cnt_width)) MOD10 (
        .clk(clk),
        .enable(enable),
        .reset_n(reset_n),
        .counter(counter_out)
    );

    // monitor
    initial begin
        $monitor("time=%0t enable=%b reset=%b counter=%0d",
                  $time, enable, reset_n, counter_out);
    end

    // stimulus
    initial begin
        // hold reset
        #1;
        reset_n = 0;

        // release reset
        #1;
        reset_n = 1;

        // wait then enable
        repeat (2) @(posedge clk);
        enable = 1;

        // run counter
        repeat (15) @(posedge clk);
    end

    // stop simulation
    initial begin
        #20 $stop;
    end

endmodule