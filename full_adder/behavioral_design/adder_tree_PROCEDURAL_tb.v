module adder_tree_tb ();
    
    // variable declartion
    reg [3:0] a , b;
    reg [7:0] c , d;
    wire [4:0] sum1;
    wire [8:0] sum2;
    wire [9:0] sum;

    // instantiate DUT
    adder_tree TEST (git
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .sum1(sum1),
        .sum2(sum2),
        .sum(sum)
    );

    // monitor output
    initial begin
        $monitor("a = %d b = %d c = %d d = %d, %d + %d = %d",
                        a, b, c, d, sum1, sum2, sum);
    end

    // generate stimulus 
    initial begin
        repeat (50) begin
            a = $random & 4'b1111; // limit to 4 bits
            b = $random & 4'b1111;
            c = $random & 8'hFf;
            d = $random & 8'hFF;

            #1; 

            // check for error
            if (sum != (a + b + c + d)) begin
                $display("ERROR: a = %d b = %d c = %d d = %d sum = %d",
                                    a, b, c, d, sum);
            end
            
            #2;
        end
        $finish;
    end



endmodule