`timescale 1us/1ns
module n_bit_decoder #(
    parameter N = 3
) (
    input [N-1:0] d,
    input enable,
    output reg [2**N-1:0] q
);
    always @(*) begin
        if (enable == 0)
            q = 0;
        else 
           q = (1 << d);        
    end

endmodule