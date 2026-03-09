module half_adder_structural (
    input a,
    input b,
    output sum,
    output carry
);

//instantiating built-in primitives and connect them with nets

xor XOR1  (sum, a, b); //fisrt value in bracket is always outpur
and AND1 (carry, a, b);

endmodule