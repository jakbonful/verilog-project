`timescale 1us/1ns
module  task_meters_to_feet();
    // testbench variables
        real meters;
        real feet;
        reg clk = 0;


    // task
        task meters_to_feet (input real meters, output real feet);
            begin
                feet = meters * 3.2808;
                $display($time, " meters = %0.4f feet = %0.4f", meters, feet);
            end
        endtask

    // clock
        always #0.5 clk = ~clk;

    // task call
        initial begin
            @(posedge clk) meters = 1.50; meters_to_feet(meters, feet);
            @(posedge clk) meters = 1.94; meters_to_feet(meters, feet);
            @(posedge clk) meters = 1.88; meters_to_feet(meters, feet);
            @(posedge clk) meters = 3; meters_to_feet(meters, feet);
            @(posedge clk) meters = 1.93; meters_to_feet(meters, feet);
            @(posedge clk) meters = 2.0; meters_to_feet(meters, feet);
            repeat (10) @(posedge clk);

            $stop;
        end

endmodule