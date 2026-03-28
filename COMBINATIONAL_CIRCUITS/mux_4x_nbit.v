`timescale 1us/1ns
module mux_4x_nbit #(
    parameter BUS_WIDTH = 8
) (
    input [BUS_WIDTH-1:0] a,
    input [BUS_WIDTH-1:0] b,
    input [BUS_WIDTH-1:0] c,
    input [BUS_WIDTH-1:0] d,
    input [1:0] selector,
    output reg [BUS_WIDTH-1:0] y
);

always @(*) begin
    case (selector)
        2'd0 : y = a; 
        2'd1 : y = b; 
        2'd2 : y = c; 
        2'd3 : y = d; 
        default: y = a;
    endcase
end
    
endmodule