module  n_bit_encoder #(
    parameter N = 4
) (
    input [2**N-1:0] a,
    input enable,
    output reg [N-1:0] y
);
    integer i;

    always @(*) begin
        if (!enable) begin
            y = 0;
        end else begin
            y = 0; 
            for (i = 0; i < 2**N; i = i +1) begin
                if (a[i]) begin
                    y = i;
                end
            end
        end
    end
    
endmodule