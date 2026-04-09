`timescale 1ns/1ps

module nbit_counter #(
    parameter counter_width = 4
) (
    input clk,
    input reset_n,
    input control_signal, // 0 - count down | 1 - count up
    input enable,
    output reg [counter_width-1:0] counter
    
);

always @(posedge clk or negedge reset_n) begin
    if (!reset_n)
        counter <= 0;
    else if (enable)
        case (control_signal)
            1'b0  : counter <= counter - 1'b1;  // down counter
            1'b1  : counter <= counter + 1'b1;  // up counter
        endcase 
end
    
endmodule
