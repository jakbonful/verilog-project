`timescale 1us/1ps
module tri_buffer (
    input d_in,
    input enable,
    output d_out
);

    // buffif1 active HIGH (output, input, control signal)
    // buffif0 active LOW (output, input, control signal)

    bufif1 B1 (d_out, d_in, enable);

endmodule