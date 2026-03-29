`timescale 1us/1ns
module ALU #(
    parameter N = 8
) (
    input [N-1:0] a,
    input [N-1:0] b,
    input carry_in,
    input [3:0] opcode,
    output reg [N-1:0] y,
    output reg carry_out,
    output reg borrow, 
    output zero,
    output parity,
    output reg invalid_op
);

//list of opcodes   
    localparam op_add = 1; // a + b
    localparam op_add_carry = 2; // a + b + carry
    localparam op_sub = 3; // a - b
    localparam op_inc = 4; // increment a
    localparam op_dec = 5; // decrement a
    localparam op_and = 6; // bitwise AND
    localparam op_not = 7; // NOT a
    localparam op_rol = 8; // rotate left a
    localparam op_ror = 9; // rotate right a
    
always @(*) begin
    y = 0; carry_out = 0; borrow = 0; invalid_op = 0;
    case (opcode)
        op_add : y = a + b;
        op_add_carry :  {carry_out, y} = a + b + carry_in;
        op_sub : {borrow, y} = a - b;
        op_inc : {carry_out, y} = a + 1'b1;
        op_dec : {borrow, y} = a - 1'b1;
        op_and : y = a & b;
        op_not : y = ~a;
        op_rol : y = {a[N-2:0], a[N-1]};
        op_ror : y =  {a[0], a[N-1:1]};
        default: invalid_op = 1;
    endcase    
end
    assign parity = ^y;
    assign zero = (y == 0);

endmodule