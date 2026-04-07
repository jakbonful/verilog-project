`timescale 1us/1ns
module shift_reg_left_right #(
    parameter N = 8
)(
    input [N-1:0] i,
    input clk,
    input load,
    input reset_n,
    input left_or_right,
    output reg [N-1:0] q
);

always @(posedge clk or negedge reset_n) begin
    if (!reset_n) 
        q <= 0;

    else if (load) 
        q <= i;

    else begin
        case (left_or_right)
            0: q <= {q[N-2:0], 1'b0};   // shift left
            1: q <= {1'b0, q[N-1:1]};   // shift right
        endcase
    end
end

endmodule