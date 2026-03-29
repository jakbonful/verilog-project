`timescale 1us/1ns
module ALU_tb;

    // Parameters
    parameter BUS_WIDTH = 8;

    // Inputs
    reg [BUS_WIDTH-1:0] m;
    reg [BUS_WIDTH-1:0] n;
    reg carry;
    reg [3:0] opcode;

    // Outputs
    wire [BUS_WIDTH-1:0] o;
    wire carry_out;
    wire borrow;
    wire zero;
    wire parity;
    wire invalid_op;

    // Instantiate the ALU
    ALU #(.N(BUS_WIDTH)) dut (
        .a(m),
        .b(n),
        .carry_in(carry),
        .opcode(opcode),
        .y(o),
        .carry_out(carry_out),
        .borrow(borrow),
        .zero(zero),
        .parity(parity),
        .invalid_op(invalid_op)
    );

    // Monitor signals
    initial begin
        $display("\n--- Arithmetic Logic Unit Testbench ---\n");
        $display("opcode |   m  |   n  | carry |    o   | carry_out | borrow | zero | parity | invalid_op");
        $monitor(" %d    | %3d  | %3d  |   %d  | %3d    |     %d    |   %d   |  %d  |   %b   |     %d",
                 opcode, m, n, carry, o, carry_out, borrow, zero, parity, invalid_op);
    end

    // Generate random stimulus
    initial begin
        // Initialize inputs
        m = 0; n = 0; carry = 0; opcode = 0;
        #1;

        // Apply 50 random test vectors
        repeat (20) begin
            opcode = $urandom % 10; // opcodes 0-9
            m      = $urandom & ((1 << BUS_WIDTH) - 1);
            n      = $urandom & ((1 << BUS_WIDTH) - 1);
            carry  = $urandom % 2;
            #1; // small delay to let ALU compute
        end

        $finish; // End simulation after tests
    end

endmodule