module  adder_tree (
    input [3:0] a,
    input [3:0] b,
    input [7:0] c,
    input [7:0] d,

    // always define output as reg with procedural assignments
    output reg [4:0] sum1,
    output reg [8:0] sum2,
    output reg [9:0] sum
);  

// NB order of assignments is NOT important

always @(*) begin
    sum1 = a + b;
end

always @(*) begin
    sum2 = c + d;
end 



always @(*) begin
    sum = sum1 + sum2;
end
    
endmodule