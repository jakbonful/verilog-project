`timescale 1us/1ns

module shift_reg_piso_tb ();

//testbench variables
    reg sdi;
    reg [3:0] d;
    reg preload;
    reg clk = 0;
    reg reset_n;
    wire sdo;

//instantiate DUT
    shift_reg_piso PISO0(
        .reset_n(reset_n),
        .clk(clk),
        .sdi(sdi),
        .pl(preload),
        .d(d),
        .sdo(sdo)
    );

//clock signal
    always  begin
        #0.5 clk = ~clk;
    end

//create stimulus
    initial begin
        #1; //apply reset to the circuit 
        reset_n = 0; sdi = 0; preload = 0; d = 0;
        #1.3; //release the reset
        reset_n = 1;

        //preload register with value 4'b0101 and shift
        @(posedge clk); d = 4'b0101; preload = 1;
        @(posedge clk); preload = 0;

        //wait for the bits to shift
        repeat(5) @ (posedge clk);
    end

//stop simulator 
    initial begin
        #20 $stop;
    end
endmodule