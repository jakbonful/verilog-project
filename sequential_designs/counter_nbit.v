`timescale 1us/1ns
module nbit_counter #(
    parameter N = 4
) (
    input clk,
    input reset_n,
    output reg [N-1:0] counter
);

always @(posedge clk or negedge reset_n) begin
    if (!reset_n)
        counter <= 0;
    else 
        counter <= counter + 1'b1;
end
    
endmodule