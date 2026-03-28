// declare module
module encoder_8to3 (
    input [7:0] d,
    input enable,
    output reg [2:0] y
);

    integer  i;

    always @(*) begin
        if (enable == 0) begin
            y = 8'b0;
        end else begin
            y = 3'b000; //default
            for (i = 0; i < 8;i = i +1) begin
                if (d[i]) begin
                    y  = i[2:0];
                end
            end
        end
    end
    
endmodule