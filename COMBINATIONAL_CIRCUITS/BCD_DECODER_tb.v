`timescale 1us/1ns

module bcd_decoder_tb();
    //declare variables
    reg [3:0] in;
    wire a;
    wire b;
    wire c;
    wire d;
    wire e;
    wire f;
    wire g;
    wire dot;

    integer i;

    //instantiate DUT
    bcd_decoder segment_display (
        .bcd(in),
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .e(e),
        .f(f),
        .g(g),
        .dot(dot)
    );

    //monitor output 
    initial begin
        $display("Seven Segment Display");
        $monitor("in = %b seven_seg_code = %b dot = %b", in, {a,b,c,d,e,f,g}, dot);
    end

    //generate stimulus 
    initial begin
        #1; 
        in = 0;
        repeat (50) begin
            #1;  // wait 1 time unit between inputs
            in = $urandom & 4'b1111;
        end
    end

endmodule