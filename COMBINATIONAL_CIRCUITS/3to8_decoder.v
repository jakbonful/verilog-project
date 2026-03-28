`timescale 1us/1ns

module decoder3to8 #(
    parameter N = 3
)(
    input [N-1:0] x,
    input enable,
    output reg [2**N-1:0] y
);

always @(*) begin
    if (!enable) begin
        y = 0;
    end else begin
        y = (1 << x);
    end
end

endmodule