`timescale 1us/1ns
module shift_reg_sipo #(
    parameter N = 4
) (
    input d_in,
    input clk,
    input reset_n,
    output reg [N-1:0] q_out
);

always @(posedge clk or negedge reset_n) begin
    if (!reset_n)
        q_out <= 0;
    else
        q_out <= {q_out[N-2:0], d_in}; // shift left and insert new bit at LSB
end
    
endmodule