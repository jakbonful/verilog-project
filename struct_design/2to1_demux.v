`timescale 1us/1ns

module demux_design  (
    input a,
    input selector,
    output b,
    output c
);

wire not_selector;


//structural demux design
not not1 (not_selector, selector);
and and1 (b, not_selector, a);
and and2 (c, selector, a);
    
endmodule