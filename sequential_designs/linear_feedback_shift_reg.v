`timescale 1us/1ns
module lfsr_16 (
    input reset_n,
    input clk,
    input enable,
    output reg [15:0] lfsr
);

    // seed(initialization) is the starting bit stream in the cycle and should be non-zero all the time
    localparam seed = 16'h1001;
    wire feedback;

    /* fibonacci sequence:
        x^16 + x^14 + x^13 + x^11 + 1
    */
    
    assign feedback = lfsr[15] ^ lfsr[13] ^ lfsr[12] ^ lfsr[10];

    always @(posedge clk or negedge reset_n) begin
         if (!reset_n)
            lfsr <= seed;
        else if (enable)
            lfsr <= {lfsr[14:0], feedback};

    end
    
   
    
endmodule