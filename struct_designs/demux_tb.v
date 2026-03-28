`timescale 1us/1ns

module demux_tb ();
    reg a;
    reg s;
    wire b;
    wire c;

    integer i,j,k;

    // istantiate DUT
    demux_design TEST (
        .a(a),
        .selector(s),
        .b(b),
        .c(c)
    );

    // initialize inputs
    initial begin
         a = 0; s = 0;
    end

    // monitor outputs
    initial begin
        $monitor("time = 0%t | a=%b s = %b b =%b c=%b",
                    $time, a, s, b, c);
    end

    //  generate stimulus 
    initial begin
        for (i = 0; i < 2; i = i + 1) begin
            for (j = 0; j < 2; j = j + 1) begin
                a = i;  s = j;
                #10; // small delay for simulation   
            end
        end
    end
endmodule