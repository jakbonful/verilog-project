`timescale 1us/1ns

module demux_4x_nbit #(
    parameter BUS_WIDTH = 8
) (
    input [BUS_WIDTH-1:0] y,
    input [1:0] selector,
    
    output reg [BUS_WIDTH-1:0] a,
    output reg [BUS_WIDTH-1:0] b,
    output reg [BUS_WIDTH-1:0] c,
    output reg [BUS_WIDTH-1:0] d
);
    always @(*) begin
    // Default all outputs to 0
    a = 0;
    b = 0;
    c = 0;
    d = 0;

    case (selector)
        2'd0: a = y;
        2'd1: b = y;
        2'd2: c = y;
        2'd3: d = y;
    endcase
end

    
endmodule