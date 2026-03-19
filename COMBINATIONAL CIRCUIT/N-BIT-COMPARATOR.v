module N_BIT_COMPARATOR
    // paremeter section
    #( parameter N = 4)(
    input [N-1:0] a,
    input [N-1:0] b,
    output reg  equal,
    output reg  greater,
    output reg  lesser
);

    //comparator computation
    always @(*) begin
        if (a == b) begin
            equal = 1;
            greater = 0;
            lesser = 0;
        end 
        
        else if (a > b) begin
            equal = 0;
            greater = 1;
            lesser = 0;
        end

        else begin 
            equal = 0;
            greater = 0;
            lesser = 1;
        end
    end
endmodule