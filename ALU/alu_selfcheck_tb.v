`timescale 1us/1ns

module ALU_SC_tb ();

    // Parameters
    parameter bus_width = 8;

    // DUT Inputs
    reg [3:0] opcode;
    reg [bus_width-1:0] a;
    reg [bus_width-1:0] b;
    reg carry_in;

    // DUT Outputs
    wire [bus_width-1:0] y;
    wire carry_out;
    wire borrow;
    wire zero;
    wire parity;
    wire invalid_op;

    // Opcodes
    localparam OP_ADD        = 1;
    localparam OP_ADD_CARRY  = 2;
    localparam OP_SUB        = 3;
    localparam OP_INC        = 4;
    localparam OP_DEC        = 5;
    localparam OP_AND        = 6;
    localparam OP_NOT        = 7;
    localparam OP_ROL        = 8;
    localparam OP_ROR        = 9;

    // Counters
    integer success_count = 0;
    integer error_count   = 0;
    integer test_count    = 0;
    integer i;

    // DUT Instance
    ALU #(.N(bus_width)) dut1 (
        .a(a),
        .b(b),
        .carry_in(carry_in),
        .opcode(opcode),
        .y(y),
        .carry_out(carry_out),
        .borrow(borrow),
        .zero(zero),
        .parity(parity),
        .invalid_op(invalid_op)
    );

    // ============================================================
    // Reference Model (Golden Model)
    // ============================================================
    function [bus_width+4:0] model_ALU (
        input [3:0] opcode,
        input [bus_width-1:0] a,
        input [bus_width-1:0] b,
        input carry_in
    );

        reg [bus_width-1:0] y_m;
        reg carry_out_m;
        reg borrow_m;
        reg zero_m;
        reg parity_m;
        reg invalid_op_m;

        begin
            // Default values
            y_m = 0;
            carry_out_m = 0;
            borrow_m = 0;
            zero_m = 0;
            parity_m = 0;
            invalid_op_m = 0;

            case (opcode)
                OP_ADD:        {carry_out_m, y_m} = a + b;
                OP_ADD_CARRY:  {carry_out_m, y_m} = a + b + carry_in;

                OP_SUB: begin
                    y_m = a - b;
                    borrow_m = (a < b);
                end

                OP_INC: {carry_out_m, y_m} = a + 1;

                OP_DEC: begin
                    y_m = a - 1;
                    borrow_m = (a == 0);
                end

                OP_AND: y_m = a & b;
                OP_NOT: y_m = ~a;

                OP_ROL: y_m = {a[bus_width-2:0], a[bus_width-1]};
                OP_ROR: y_m = {a[0], a[bus_width-1:1]};

                default: begin
                    invalid_op_m = 1;
                    y_m = 0;
                end
            endcase

            parity_m = ^y_m;
            zero_m   = (y_m == 0);

            model_ALU = {invalid_op_m, parity_m, zero_m, borrow_m, carry_out_m, y_m};
        end
    endfunction

    // ============================================================
    // Compare Task (Self-checking)
    // ============================================================
    task compare_data (
        input [bus_width+4:0] expected,
        input [bus_width+4:0] observed
    );
    begin
        test_count = test_count + 1;

        if (expected === observed) begin
            success_count = success_count + 1;
        end else begin
            error_count = error_count + 1;

            $display("\nERROR at time %0t", $time);
            $display("Inputs: opcode=%0d a=%0d b=%0d carry_in=%0d",
                      opcode, a, b, carry_in);

            $display("EXPECTED: invalid=%b parity=%b zero=%b borrow=%b carry=%b y=%b",
                      expected[bus_width+4],
                      expected[bus_width+3],
                      expected[bus_width+2],
                      expected[bus_width+1],
                      expected[bus_width],
                      expected[bus_width-1:0]);

            $display("OBSERVED: invalid=%b parity=%b zero=%b borrow=%b carry=%b y=%b\n",
                      observed[bus_width+4],
                      observed[bus_width+3],
                      observed[bus_width+2],
                      observed[bus_width+1],
                      observed[bus_width],
                      observed[bus_width-1:0]);
        end
    end
    endtask

    // ============================================================
    // Stimulus
    // ============================================================
    initial begin

        for (i = 0; i < 100; i = i + 1) begin

            opcode   = $urandom_range(0, 10);   // includes invalid cases
            a        = $urandom_range(0, 255);
            b        = $urandom_range(0, 255);
            carry_in = $urandom_range(0, 1);

            #1; // allow combinational settling

            compare_data(
                model_ALU(opcode, a, b, carry_in),
                {invalid_op, parity, zero, borrow, carry_out, y}
            );

            #2;
        end

        // Final Report
        $display("\n================ TEST SUMMARY ================");
        $display("Total Tests : %0d", test_count);
        $display("Passed      : %0d", success_count);
        $display("Failed      : %0d", error_count);
        $display("==============================================\n");

        #10 $stop;
    end

endmodule