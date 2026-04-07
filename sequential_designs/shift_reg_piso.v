`timescale 1us/1ns

module shift_reg_piso (
    input clk,
    input reset_n,
    input sdi,  // serial data in
    input pl,
    input [3:0] d,
    output sdo  
);

//internal 4 bits wide  register (4 flip flops)
    reg  [3:0] piso;
    wire [3:0] data_src; //nets after the mux'es



// if p1 == 1 uses the parallel input as data or if p1 == 0 uses the shift register output and the serial data input as data
    assign data_src = pl ? d : {piso[2:0], sdi};

//parallel in serial out
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            piso <= 4'b0;
        else
          piso[3:0] <= data_src;
    end


//connect the sdo net to the register MSB
    assign sdo  = piso[3];

endmodule