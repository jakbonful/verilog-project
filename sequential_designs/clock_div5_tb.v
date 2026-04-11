`timescale 1us/1ns
module clk_div5_tb ();
    
    // TESTBENCH VARIABLE
        parameter div_by = 3;
        parameter cnt_width = $clog2(div_by);

        reg clk = 0;
        reg reset_n;
        wire clk_output;
        wire [cnt_width-1:0] count;

    
    // DUT
        clk_div5 #(.div_by(div_by), .cnt_width(cnt_width)) CLK0 (
            .clk(clk),
            .reset_n(reset_n),
            .clk_output(clk_output),
            .count(count)
        );

    // CLOCK
        always #0.5 clk = ~clk;

    // STIMULUS
        initial begin
            #1; reset_n = 0;
            #1; reset_n = 1;

            repeat (10) @(posedge clk);

            $stop;
        end

    
endmodule