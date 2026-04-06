`timescale 1us/1ns
module shift_reg_siso_tb ();

//testbench variables
    reg clk = 0;
    reg reset_n;
    reg d;
    wire q;

//instantiate DUT
    shift_reg_siso SISO0(
        .clk(clk),
        .reset_n(reset_n),
        .d_in(d),
        .q_out(q)
    );

//clock signals
    always  begin
        #0.5 clk = ~clk;
    end

//stimulus
    initial begin
        #1; //apply reset to circuit after 1us
        reset_n = 0; d = 0;

        #1.3; //release the reset
        reset_n = 1;

        //set d_in for 1 clock
        @ (posedge clk); d = 1'b1;
        @ (posedge clk); d = 1'b0;

        //wait for bit to shift
        repeat(5) @(posedge clk);
        @(posedge clk); d = 1'b1;
        @(posedge clk);
        @(posedge clk); d = 1'b0;
        
    end

//stop simulation
  initial begin
      #40 $stop;
  end

endmodule