`timescale 1ns/1ps

module nbit_counter_tb ();

    // testbench variables
        parameter N = 4;
        reg clk = 0;
        reg enable;
        reg reset_n;
        reg control;
        reg load_en;
        reg  [N-1:0] load;
        wire [N-1:0] counter;

    // DUT
        nbit_counter #(.counter_width(N)) COUNTER (
            .clk(clk),
            .reset_n(reset_n),
            .enable(enable),
            .control_signal(control),
            .counter(counter),
            .load(load),
            .load_en(load_en)
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
            #1;
            reset_n = 0;
            enable  = 0;
            load_en = 0;
            control = 0;
            load    = 0;

            repeat (2) @(posedge clk);

            // Release reset
            reset_n = 1;

            // Load value
            load_en = 1;
            load = 4'b1000;
            @(posedge clk);

            load_en = 0;

            // Enable counting
            enable = 1;

            // Count up
            control = 1;
            repeat (16) @(posedge clk);

            // Count down
            control = 0;
            repeat (16) @(posedge clk);
        end
       
    
    //stop 
        initial begin
            #33 $stop;
        end
endmodule