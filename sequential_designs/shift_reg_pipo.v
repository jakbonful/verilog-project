`timescale 1us/1ns
module shift_reg_pipo (
    input clk,
    input reset_n,
    input [3:0] d_in,
    output reg [3:0] q_out
);

always @(posedge clk or negedge reset_n) begin
    if (!reset_n)
        q_out <=  0;
    else
        q_out[3:0] <= d_in[3:0];
end
    
endmodule