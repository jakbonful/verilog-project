`timescale 1us/1ns

module d_latch (
    input d,
    input enable,
    input reset,   // active HIGH reset
    output q,
    output q_not
);

    reg dlatch;

    always @(*) begin
        dlatch = dlatch;        // default: hold value

        if (reset)
            dlatch = 1'b0;      // reset dominates
        else if (enable)
            dlatch = d;         // transparent when enabled
    end

    assign q = dlatch;
    assign q_not = ~dlatch;

endmodule