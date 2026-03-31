`timescale 1us/1ns

module d_latch_tb ();

reg d;
reg enable;
reg reset;

wire q;
wire q_not;

// Instantiate DUT
d_latch DLatch (
    .d(d),
    .enable(enable),
    .reset(reset),
    .q(q),
    .q_not(q_not)
);

// Monitor
initial begin
    $display("D Latch");
    $monitor("d=%b enable=%b reset=%b q=%b q_not=%b",
              d, enable, reset, q, q_not);
end

// Stimulus
initial begin
    d = 0; enable = 0; reset = 1;
    #1;

    repeat(20) begin
        {d, enable, reset} = $random;
        #1;
    end
end

// Stop simulation
initial begin
    #50 $stop;
end

endmodule