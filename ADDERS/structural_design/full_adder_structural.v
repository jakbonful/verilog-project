module full_adder_structural ( //defining the 1bit full adder
    input a,
    input b,
    input carry_in,
    output sum,
    output carry_out
    );

wire sum1;
wire carry1;
wire carry2;

//instantiate the user defined module 

half_adder_structural HA1(
    .a(a),
    .b(b),
    .sum(sum1),
    .carry(carry1)  
);

half_adder_structural HA2(
    .a(sum1),
    .b(carry_in),
    .sum(sum),
    .carry(carry2)
);

or (carry_out, carry1, carry2);

endmodule