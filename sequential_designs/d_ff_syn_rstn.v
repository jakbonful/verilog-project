`timescale 1us/1ns
module d_ff_syn_rstn (
    input d,
    input clk,
    input reset_n, //active low reset
    output reg q,
    output q_not
);

// non blocking operator for sequential logic

always @(posedge clk ) begin
    if (!reset_n)  
        q <= 1'b0;
    else    
        q <= d;
end

assign q_not = ~q;


    
endmodule