module comparator_tb ();

    reg a;
    reg b;

    wire eq;
    wire gr;
    wire le;

    integer i, j;

    // instantiate DUT
    comparator TEST (
        .a(a),
        .b(b),
        .equal(eq),
        .greater(gr),
        .lesser(le)
    );

    // monitor outputs
    initial begin
        $monitor("time =%0t | b=%b | equal=%b | greater=%b | lesser=%b",
                    $time, a, b, eq, gr, le);
    end

    // stimulus
    initial begin
        for (i = 0; i < 2; i = i + 1) begin
            for (j = 0; j < 2; j = j + 1) begin
                a = i; 
                b = j;
                #10;
            end
        end
    end

endmodule