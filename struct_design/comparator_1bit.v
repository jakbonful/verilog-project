module  comparator (
    input a,
    input b,
    output equal,
    output greater,
    output lesser
);
    // comparator computation
    wire not_1;
    wire not_2;

    not (not_1, a);
    not (not_2, b);

    xnor XNOR1 (equal, a, b);
    and  AND1  (greater, a, not_2);
    and  AND2  (lesser, not_1, b);
    
endmodule~