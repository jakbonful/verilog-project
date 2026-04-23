`timescale 1us/1ns
module shift_reg_pipo_buggy (
    input clk,
    input reset_n,
    input [7:0] data_in,
    output reg [7:0] data_out
);
    
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            data_out <= 0;
        end
        else begin
          //  data_out[7:0] <= data_in[6:0]; //intentional bug size MISMATCH , MSB not connected
            data_out[7:0] <= data_in[7:0]; //fixed
        end
    end
endmodule