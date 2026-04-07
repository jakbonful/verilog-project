`timescale 1us/1ns

module shift_reg_left_right_tb();

    parameter register_width = 8;

    reg [register_width-1:0] i;
    reg clk = 0;
    reg load;
    reg reset_n;
    reg left_or_right;
    wire [register_width-1:0] q;

    // Instantiate DUT
    shift_reg_left_right #(.N(register_width)) SRLR (
        .i(i),
        .clk(clk),
        .load(load),
        .reset_n(reset_n),
        .left_or_right(left_or_right),
        .q(q)
    );

    // Clock generation
    always #0.5 clk = ~clk;

    // Stimulus
    initial begin
        // Reset
        #1;
        reset_n = 0; i = 0; load = 0; left_or_right = 0;
        #1; 
        reset_n = 1;

        // Load random data
        @(posedge clk); 
        load = 1; 
        i = $random & ((1<<register_width)-1);
        repeat(5) @(posedge clk);

        // Shift right
        @(posedge clk); 
        load = 0; 
        left_or_right = 1;
        @(posedge clk);

        // Load again while shifting right
        @(posedge clk); 
        load = 1; 
        left_or_right = 1;
        i = $random & ((1<<register_width)-1);  // new random value for load

        // Shift left for 2 cycles
        repeat(2) @(posedge clk) begin
            load = 0; 
            left_or_right = 0;
        end

        // Stop simulation
        #5 $stop;
    end

endmodule