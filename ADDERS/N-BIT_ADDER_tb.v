module nbit_adder_tb ();

    // declare variables
    parameter ADDER_WIDTH =  10;
    reg [ADDER_WIDTH-1:0] a;
    reg [ADDER_WIDTH-1:0] b;
    wire [ADDER_WIDTH:0] sum;

    // instantiate the parameterized DUT
    nbit_adder #(.N(ADDER_WIDTH))  ADDER1 (
        .a(a),
        .b(b),
        .sum(sum)
    );

    // monitor and generate random stimulus
    initial begin
        $monitor("a = %d, b = %d, sum = %d",
                    a, b, sum);
        repeat (50) begin
            a = $random & ((1<<ADDER_WIDTH)-1);
            b = $random & ((1<<ADDER_WIDTH)-1);

            #1;

            // check for error
            if (sum != a + b) begin
                $display("ERROR: a = %d b = %d sum = %d",
                            a, b, sum );
            end 
        end
    end
   
    
    
endmodule