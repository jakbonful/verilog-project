`timescale 1ns/1ps

module nbit_counter_tb ();

    // testbench variables
        parameter N = 4;
        reg clk = 0;
        reg enable;
        reg reset_n;
        reg control;
        wire [N-1:0] counter;

    // DUT
        nbit_counter #(.counter_width(N)) COUNTER (
            .clk(clk),
            .reset_n(reset_n),
            .enable(enable),
            .control_signal(control),
            .counter(counter)
        );

    // clock signals
        always  begin
            #0.5 clk = ~clk;
        end

    // monitor stimulus
        initial begin
            $monitor("time = %0t ns, enable = %b, counter = %d", $time, enable, counter);
        end

    //  stimulus
        initial begin
            reset_n = 0;
            enable  = 0;
            control = 1'b1;  // start with up
            #1;

            // Release reset and enable counting
            reset_n = 1;
            enable  = 1;

            // Count up from 0 → 15
            control = 1'b1;           // counting up
            repeat (16) @(posedge clk); // 16 cycles (0..15)

            // Count down from 15 → 0
            control = 1'b0;           // counting down
            repeat (16) @(posedge clk); // 

        end
    
    //stop 
        initial begin
            #33 $stop;
        end
endmodule