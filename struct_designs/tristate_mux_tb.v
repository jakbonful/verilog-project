module tristate_mux_tb ();
    reg a = 0;
    reg b = 0;
    reg e = 0;
    wire y;

    integer i, j, k;

    // instantiate the DUT 
    tristate_mux TEST (
        .a(a),
        .b(b),
        .selector(e),
        .y(y)
    );

    // monitor the outputs 
    initial begin
        $monitor("a = %b | b = %b | e = %b | y = %b",  
                    a, b, e, y);
    end 

    // generate stimulus   
    initial begin
        for (i = 0; i < 2; i = i + 1) begin
            for (j = 0; j < 2; j = j + 1) begin
                 for (k = 0; k < 2; k = k + 1) begin
                    a = i; b = j; e = k;
                    #10; 
                 end
             end
        end
    end

endmodule