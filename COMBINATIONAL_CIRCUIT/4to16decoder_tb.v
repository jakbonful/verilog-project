`timescale 1us/1ns

module decoder4to16_tb ();

    // declare variables
    parameter DEC_SIZE = 4;

    reg [DEC_SIZE-1:0] a;
    reg enable;

    wire [2**DEC_SIZE-1:0] b;

    // for verification
    integer i;

    // instantiate DUT
    decoder4to16 #(.N(DEC_SIZE)) DEC_TB (
        .a(a),
        .enable(enable),
        .b(b)
    );

    //  monitor values
    initial begin
        $display("4 to 16 Decoder \n");

        $monitor("a = %b enable = %b b = %b", a, enable, b);
    end

    // generate stimuls
    initial begin
           enable = 0; 
           a = 0;

           #1;

        for (i  = 0; i < 2**DEC_SIZE; i = i + 1) begin
            enable = 1;
            a = i; 
            #1;
            
        end
    end

    

    
endmodule