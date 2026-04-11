`timescale 1us/1ns
module clk_div5 #(
    parameter div_by = 5,
    parameter cnt_width = $clog2(div_by)
) (
    input clk,
    input reset_n,
    output reg clk_output,
    output reg [cnt_width-1:0] count
);

always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
        count <= 0;
        clk_output <= 0; // divide f by clk_output
    end 
    else begin
        if (count == (div_by - 1)) begin
            count <= 0;
            clk_output <= ~clk_output; // toggle ONLY here
        end 
        else begin
            count <= count + 1'b1;
        end
    end
end

endmodule

/*
    to use the frequency divider of 5 ie trigger when change is happening at that particular time we can do
            always @ (posedge clk_output)  
 */