module pri_enc_4to2 (
    input [3:0] a,
    output reg [1:0] q,
    output reg x
);

//priority of the set bits
    always @(*) begin
        if (a[3])
            q = 2'd3;
        else if (a[2])
            q = 2'd2;
        else if (a[1])
            q = 2'd1;
        else
            q = 2'd0;
    end
        
    always @(*) begin
        if (!a)
            x = 0;
        else 
            x = 1;
    end
    
endmodule