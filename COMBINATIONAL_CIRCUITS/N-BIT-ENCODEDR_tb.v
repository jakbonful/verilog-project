module n_bit_encoder_tb ();
    
    // declare variables
    parameter ENCODER_SIZE = 5;

    reg [2**ENCODER_SIZE-1:0] a;
    reg enable;

    wire [ENCODER_SIZE-1:0] y;

    integer i;



    //  instantiate the DUT
    n_bit_encoder #(.N(ENCODER_SIZE)) ENCODER1 (
        .a(a),
        .enable(enable),
        .y(y)
    );

    //  generate stimulus and monitor output
    initial begin
        $display("Encoder Output\n");

        $monitor("enable = %b | a = %b | y = %b",
                    enable, a, y);

        #1; a = 0; enable = 0;
        for (i = 0; i < 2**ENCODER_SIZE ; i = i + 1) begin
            #1; a = (1 << i); enable = 1;
        end
    end
endmodule