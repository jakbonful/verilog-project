`timescale 1us/1ns

module mux_4x_nbit_tb ();
    parameter BUS_WIDTH = 8;

    reg [BUS_WIDTH-1:0] a;
    reg [BUS_WIDTH-1:0] b;
    reg [BUS_WIDTH-1:0] c;
    reg [BUS_WIDTH-1:0] d;
    reg [1:0] sel;
    wire [BUS_WIDTH-1:0] y;

    integer i;

    //instantiate the DUT
    mux_4x_nbit #(.BUS_WIDTH(BUS_WIDTH)) nMUX (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .selector(sel),
        .y(y)
    );

    //monitor 
    initial begin
        $display("4x%0d-bit Mux", BUS_WIDTH);
        $monitor("sel=%d a=%d b=%d c=%d d=%d y=%d", sel, a, b, c, d, y);
    end

    //generate stimulus 
    initial begin
        sel = 0; a = 0; b = 0; c = 0; d = 0;
        #1;

        for (i = 0; i < 10; i = i + 1) begin
            #1;
            sel = $urandom % 4;
            a = $urandom & ((1<<BUS_WIDTH)-1);
            b = $urandom & ((1<<BUS_WIDTH)-1);
            c = $urandom & ((1<<BUS_WIDTH)-1);
            d = $urandom & ((1<<BUS_WIDTH)-1);
        end
    end
    
endmodule