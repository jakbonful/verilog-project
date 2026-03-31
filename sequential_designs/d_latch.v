module d_latch (
    input d,
    input enable,
    output q,
    output q_not
);

    reg dlatch;

    always @(*) begin
        if (enable) begin
            dlatch <= d;
        end
    end

    assign q = dlatch;
    assign q_not = ~q;
    
endmodule