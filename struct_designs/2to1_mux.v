`timescale 1us/1ns

module mux_design (
    input a,
    input b,
    input selector,
    output y
);  

wire not_selector;
wire and1;
wire and2;

//mux design using structural design style

not NOT1 (not_selector, selector);

and AND1 (and1, not_selector, a);
and AND2 (and2, selector, b);

or OR1   (y, and1, and2);

    
endmodule