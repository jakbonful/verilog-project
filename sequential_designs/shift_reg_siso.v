`timescale 1us/1ns
module shift_reg_siso (
    input reset_n,
    input clk,
    input d_in,  // serial data in
    output reg q_out // serial data out
);

//internal 4 bits wide register
    reg [3:0] siso;

//asynchronous negative reset is used
// input = output
always @(posedge clk or negedge reset_n) begin
    if (!reset_n)
        siso <= 4'b0;
    else 
        siso[3:0] <= {siso[2:0], d_in}; //shift left
end

//connect the q_out to the register MSB
    assign q_out = siso[3];
    
endmodule