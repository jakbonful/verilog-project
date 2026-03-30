`timescale 1us/1ns

module clkgen ();

//testbench for clkgen
    parameter half_period_clk1 = 0.5;
    parameter half_period_clk2 = 0.25;

    reg clock1;         //1 MHz clock, duty cycle = 50%
    reg clock2 = 0;     //2 MHz clock, duty cycle = 50%
    reg clock3;         //1 MHz clock, duly cycle = 25%

//create stimulus
    initial begin
        clock1 = 0;
        forever begin
            #(half_period_clk1);
            clock1 = ~clock1;
        end
    end

    always begin
        #(half_period_clk2);
        clock2 = ~clock2;
    end

    initial begin
        clock3 = 1;
        forever begin
            clock3 = 1; #(0.3);
            clock3 = 0; #(0.7);
        end
    end

//this will stop the simulator after 40us
    initial begin
        #40 $stop;
        $display("END of  CLKGEN");
    end

endmodule