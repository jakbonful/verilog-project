module adder_tree_tb ();
    // declare variables
    reg [3:0] a ,b;
    reg [7:0] c, d;
    wire [4:0] sum1;
    wire [8:0] sum2;
    wire [13:0] sum;

    // for verification
    integer i, j, k, l;


    // instantiate the DUT
    adder_tree TEST (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .sum1(sum1),
        .sum2(sum2),
        .sum(sum)
    );

    // monitor outputs 
    initial begin
        $monitor ("a = %d, b = %d, c = %d, d = %d, %d + %d = %d" ,   
                        a, b, c, d, sum1, sum2, sum);
    end

    // generate stimilus   
    /*initial begin
        for (i = 0; i < 16; i = i + 1 ) begin
            for (j = 0; j < 16; j = j +1 ) begin
                for (k = 0; k < 256; k = k +1 ) begin
                    for (l = 0; l < 256; l = l +1 ) begin
                        a = i; b = j; c = k; d = l; 
                        #10;
                    end
                end
            end
        end
    end */


    // random stimilus test
    initial begin
        repeat (50) begin
            a = $random & 4'hF;
            b = $random & 4'hF;
            c = $random & 8'hFF;
            d = $random & 8'hFF;

            #1;

            if (sum != (a + b + c +d))
                $display("ERROR: a = %d b = %d c = %d d = %d sum = %d", 
                                    a, b , c, d, sum);

            #9;
        end
        $finish;
    end
        

endmodule