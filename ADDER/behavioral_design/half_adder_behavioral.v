module half_adder_behavioral (
    input a,
    input b,
    output reg sum,
    output reg carry_out
);

    always @ (*) begin
      sum = a ^ b;
      carry_out = a &b;
    end 
    
endmodule
