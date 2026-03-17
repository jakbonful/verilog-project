module N_BIT_COMPARATOR_tb;

// declare variables
parameter COMP_WIDTH = 12;

reg [COMP_WIDTH-1:0] a; 
reg [COMP_WIDTH-1:0] b;

wire eq;
wire gr;
wire le;

// instantiate DUT
N_BIT_COMPARATOR #(.N(COMP_WIDTH)) COMPARATOR1 (
    .a(a),
    .b(b),
    .equal(eq),
    .greater(gr),
    .lesser(le)
);

// monitor and generate stimulus
initial begin
    a = 0;
    b = 0;

    $display("---- Starting Comparator Test ----");

    $monitor("a = %d, b = %d, equal = %b, greater = %b, lesser = %b",
                    a, b, eq, gr, le);

    repeat (30) begin
        a = $random & ((1<<COMP_WIDTH)-1);
        b = $random & ((1<<COMP_WIDTH)-1);

        #1;

        // check for error
        if (eq != (a == b)) begin
            $display("ERROR: %d is not equal to %d but showing EQUAL", a, b);
        end 

        if (gr != (a > b)) begin
            $display("ERROR: %d is not greater than %d but showing GREATER", a, b);
        end 

        if (le != (a < b)) begin
            $display("ERROR: %d is not less than %d but showing LESSER", a, b);
        end 
    end

    $display("---- Test Completed ----");
end

endmodule