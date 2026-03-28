`timescale 1ns/1ps

module mux_tb();
    reg a;
    reg b;
    reg s;
    wire y;

    integer i, j, k;

    // Instantiate DUT
    mux_design TEST(
        .a(a),
        .b(b),
        .selector(s),
        .y(y)
    );

    // Monitor outputs
    initial begin
        $monitor("Time=%0t | a=%b b=%b s=%b y=%b", $time, a, b, s, y);
    end

    // Generate stimulus
    initial begin
        for (i = 0; i < 2; i = i + 1) begin
            for (j = 0; j < 2; j = j + 1) begin
                for (k = 0; k < 2; k = k + 1) begin
                    a = i; b = j; s = k;
                    #10;  // small delay for simulation
                end
            end
        end
    end
endmodule