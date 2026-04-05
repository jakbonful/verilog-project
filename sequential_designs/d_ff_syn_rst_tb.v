`timescale 1us/1ns

module d_ff_syn_rst_tb ();

//testbench variables
    reg d;
    reg clk = 0;
    reg reset_n;
    wire q;
    wire q_not;

    reg [1:0] delay; //random delay between stages of simulation
    integer i;

//instantiate DUT
    d_ff_syn_rstn DFFO(
        .reset_n(reset_n),
        .clk(clk),
        .d(d),
        .q(q),
        .q_not(q_not)
    );

//clock generation
    always  begin
        #0.5 clk = ~clk;
    end

//stimulus generation
    initial begin
        reset_n = 0; d = 0; 
        for (i = 0; i < 4; i = i + 1) begin
            delay = $urandom_range(1,3);
            #(delay) d = ~d;
        end

        reset_n = 1;
        for (i = 0; i < 4; i = i + 1) begin
            delay = $urandom_range(1,3);
            #(delay) d = ~d; //toggle the FF at random times
        end

        d = 1'b1;
        #(0.2); reset_n = 0; //reset the FF again

    end

    initial begin
        #40 $stop;
    end    
    
endmodule