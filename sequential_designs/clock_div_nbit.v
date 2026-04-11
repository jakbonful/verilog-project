`timescale 1us/1ns
module clock_div_nbit #(
    parameter counter_width = 4
) (
    input clk,
    input reset_n,
    output reg clk_div2,
    output [counter_width-1:0] q //net
);

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)   
            clk_div2 <= 0;
        else
            clk_div2 <= ~clk_div2;
    end

    // counter DUT
    nbit_counter #(.N(counter_width)) freq_div (
        .clk(clk),
        .reset_n(reset_n),
        .counter(q)
    );
    
endmodule