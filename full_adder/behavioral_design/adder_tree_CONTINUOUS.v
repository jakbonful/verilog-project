module  adder_tree (
    // n-bit addition gives n+1 bit sum
    input [3:0] a,
    input [3:0] b,
    input [7:0] c,
    input [7:0] d,
    output [4:0] sum1,
    output [8:0] sum2,
    output [13:0] sum
);
    // order of assignments does not matter
    assign sum1 = a + b;
    assign sum2 = c + d;
    assign sum = sum1 + sum2;
    
endmodule