`timescale 1us/1ns
module shift_reg_sipo_tb ();
//testbench variables   
    parameter N = 4;
    
    reg d;
    reg clk = 0;
    reg reset; 

    wire [N-1:0] q;


//instantiate DUT
    shift_reg_sipo SIPO0(
        .d_in(d),
        .clk(clk),
        .reset_n(reset),
        .q_out(q)
    );

//clock signals 
    always  begin
        #0.5 clk = ~clk;
    end

//stimulus generation
    initial begin
        #1; //apply reset to circuit
        reset = 0; d = 0;
        #1.3; //release reset
        reset = 1;
        repeat (2) @ (posedge clk);

        // set d for 1 clocks
        @ (posedge clk); d = 1'b1; 
        @ (posedge clk); d = 1'b0;

        //set d for 2 clocks
        repeat(4) @ (posedge clk);
        @ (posedge clk); d = 1'b1;
        repeat(2) @ (posedge clk); d = 1'b0;

        //set d with '101' during 3 clocks
        repeat(3) @ (posedge clk); d = 1'b1;
        @ (posedge clk); d = 1'b0;
        @ (posedge clk); d = 1'b1;
        @ (posedge clk); d = 1'b0;
    end

//simulation 
    initial begin
        #40 $stop;
    end

endmodule