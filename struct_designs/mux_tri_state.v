module tristate_mux (
    input a, 
    input b,
    input selector,
    output y
);

bufif1 B1 (y, a, selector);
bufif0 B2 (y, b, selector);


endmodule