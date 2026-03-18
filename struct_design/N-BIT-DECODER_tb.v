`timescale 1us/1ns 
module n_bit_decoder_tb();

    //  declare variables
    parameter DEC_SIZE = 4;
    reg [DEC_SIZE-1:0] d;
    reg enable;
    
    wire [2**DEC_SIZE-1:0] q;

    integer i;

    //  instantiate DUT
    n_bit_decoder #(.N(DEC_SIZE)) DECODER1 (
        .d(d),
        .enable(enable),
        .q(q)
    );

    // monitor output
    initial begin
        $display("Output of Decoder:\n");

        $monitor("enable = %b | d = %d | q = %b",  
                    enable, d, q);

        #1; d = 0; enable = 0;
        for (i = 0; i < 2**DEC_SIZE; i = i +1) begin
            #1; d =i; enable = 1;
        end
    end

endmodule