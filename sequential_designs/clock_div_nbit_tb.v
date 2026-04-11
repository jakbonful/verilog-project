`timescale 1us/1ns
module clock_div_nbit_tb ();
    // TESTBENCH VARIABLES
        parameter tb_N = 4;

        reg clk = 0;
        reg reset_n;
        wire clk_div2;
        wire [tb_N-1:0] counter;

    // DUT
        clock_div_nbit #(.counter_width(tb_N)) clk_div (
            .clk(clk),
            .reset_n(reset_n),
            .clk_div2(clk_div2),
            .q(counter)
        );

    // CLOCK
        always #0.5 clk = ~clk;

    // STIMULUS
       initial begin
            #1; reset_n = 0;    // apply reset
            #1.2; reset_n = 1;   // release reset

            repeat(20) @(posedge clk);

       end
endmodule