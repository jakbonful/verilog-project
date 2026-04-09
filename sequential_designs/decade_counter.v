`timescale 1us/1ns

module mod_counter #(
    parameter mod_no = 10,
    parameter counter_width = $clog2(mod_no)
) (
    input clk,
    input enable,
    input reset_n,
    output reg [counter_width-1:0] counter
);

always @(posedge clk or negedge reset_n) begin
    if (!reset_n)
        counter <= 0;
    else if (enable) begin
        if (counter == mod_no-1)
            counter <= 0;
        else
            counter <= counter + 1;
    end
end
    
endmodule