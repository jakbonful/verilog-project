`timescale 1us/1ns
 
module decoder4to16 #(
    parameter N = 4
) (
    input [N-1:0] a,
    input enable,

    output  [2**N-1:0] b
);
     wire en_high, en_low;

    //generate enable signals
    assign en_high = enable  &  a[3];
    assign en_low  = enable & ~a[3];

    // instantiate 3 to 8 decoder

    decoder3to8  DEC1 (
        .x(a[2:0]),
        .enable(en_low),
        .y(b[7:0])
    );
    
    decoder3to8 DEC2 (
        .x(a[2:0]),
        .enable(en_high),
        .y(b[15:8])
    );


endmodule