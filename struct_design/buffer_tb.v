`timescale 1us/1ps
module buffer_tb ();
    // variables
    reg a;
    reg enable;
    wire b;

    integer  i, j;

    // instantiate the DUT
     tri_buffer TEST  (
        .d_in(a),
        .enable(enable),
        .d_out(b)
    );

    //  monitor output
    initial begin
        $monitor("enable = %b | a = %b | b = %b",  enable, a, b);
    end

    // generate stimulus
    initial begin
        a = 0; enable = 0;
            for (i = 0; i < 2; i = i + 1) begin
                for (j = 0; j < 2; j = j + 1) begin
                    a = i; enable = j; 
                        #10;
                end
            end
    end

        
endmodule