`timescale 1us/1ns

module d_ff_asyn_rst_tb ();

    reg clk;
    reg d;
    reg reset_n;
    reg [1:0] delay;
    wire q;
    wire q_not;

    integer i;

// instantiate DUT
    d_ff_asyn_rst DFF0 (
        .clk(clk),
        .d(d),
        .reset_n(reset_n),
        .q(q),
        .q_not(q_not)
    );

// clock generation
    initial clk = 0;
    always begin
        #0.5 clk = ~clk;
    end

// stimulus generation
    initial begin
        reset_n = 0; 
        d = 0;

        // random toggling during reset
        for (i = 0; i < 4; i = i + 1) begin
            delay = $urandom_range(1,3);
            #(delay) d = ~d;
        end

        reset_n = 1;

        // normal operation
        for (i = 0; i < 4; i = i + 1) begin
            delay = $urandom_range(1,3);
            #(delay) d = ~d;
        end

        // asynchronous reset test
        #0.3 reset_n = 0;
        #1   reset_n = 1;
    end

// runtime
    initial begin
        #50 $stop;
    end

endmodule