`timescale 1us/1ns
module shift_reg_pipo_tb ();
    reg clk = 0;
    reg reset;
    reg [3:0] d;
    wire [3:0] q;

    integer i;

//instantiate DUT
    shift_reg_pipo PIPO1(
        .clk(clk),
        .reset_n(reset),
        .d_in(d),
        .q_out(q)
    );

//clock signals
    always  begin
        #0.5 clk = ~clk;
    end

//stimulus generation   
    initial begin
        #1; // apply reset to circuit
         reset = 0; d = 0;
        
        #1.3 // reset release
         reset = 1;

         //wait for posedge of clk
         //change the data input d

        for (i = 0; i < 5; i = i +1) begin
            @ (posedge clk); d = $random;
        end
    end

//stop simulation
    initial begin
        #40 $stop;
    end
endmodule