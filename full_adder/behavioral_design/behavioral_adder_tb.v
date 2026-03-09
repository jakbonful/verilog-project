module behavioral_adder_tb();

    reg [3:0] a;
    reg [3:0] b;    
    reg cin;

    wire [3:0] sum;
    wire cout;

    // Instantiate DUT
    ripple_adder_behavioral TEST (
        .a(a),
        .b(b),
        .carry_in(cin),
        .sum(sum),
        .carry_out(cout)
    );

    integer i , j , k; 

    initial begin
        $monitor("a=%b, b=%b, cin=%b, sum=%b, cout=%b",    
                a, b, cin, sum, cout);
    end

    initial begin
        for (i = 0; i < 10; i = i + 1) begin
            for (j = 0; j < 10; j = j + 1) begin
                for (k = 0; k < 2; k = k + 1) begin
                    a = i;
                    b = j;
                    cin = k;
                    #1;
                end
            end
        end
    end

endmodule