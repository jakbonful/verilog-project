`timescale 1us/1ns
module d_latch_tb ();
    
//testbench for d_latch
    reg d;
    reg enable;

    wire q;
    wire q_not;

//instantiate the DUT
    d_latch DLatch (
    .d(d),
    .enable(enable),
    .q(q),
    .q_not(q_not)
    );

//monitor values
initial begin
    $display("D Lathch");
    $monitor("d = %b, enable = %b, q = %b, q_not = %b", d, enable, q, q_not);
end
  
//generate stimulus
initial begin
    enable = 0;
    #1; d = 0;
    #1; d = 1;
    #1.5; enable = 1;
    #0.2; d = 0;
    #0.3; d = 1;
    #1; enable = 0; d = 0;
    #1; enable = 1; d = 1;
    #2; d = 0;
    #1; enable = 0;
    #1; d = 1;
end

//stop simulator 
    initial begin
        #20 $stop;
    end

endmodule
