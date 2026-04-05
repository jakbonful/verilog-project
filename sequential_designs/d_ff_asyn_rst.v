`timescale 1us/1ns

module d_ff_asyn_rst (
    input clk,
    input d,
    input reset_n,
    output reg q,
    output q_not
);

always @(posedge clk or negedge reset_n) begin
    if (!reset_n) 
        q <= 1'b0; // asynchronous reset
    else 
        q <= d;
end

assign q_not = ~q;

endmodule