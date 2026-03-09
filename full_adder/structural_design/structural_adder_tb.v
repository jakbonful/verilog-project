module testbench ();
  // Declare variables and nets for module ports
  reg  [3:0] a, b; 
  reg cin;
  wire [3:0] sum; 
  wire cout;

  integer i, j, k; // for verification loops

  // Instantiate the DUT
  ripple_adder_structural struct4Bit_ADD (
    .a(a),
    .b(b),
    .carry_in(cin),
    .sum(sum),
    .carry_out(cout)
  );

  // Monitor the values as they change
  initial begin
    $monitor("a = %b, b = %b, cin = %b, sum = %b, cout = %b", a, b, cin, sum, cout);
  end

  // Generate stimulus
  initial begin
    // Some interesting test cases
    #1; a = 4'b0000; b = 4'b1111; cin = 0;
    #1; a = 4'b0110; b = 4'b1101; cin = 1;
    #1; a = 4'b1101; b = 4'b0001; cin = 0;
    #1; a = 4'b0100; b = 4'b1001; cin = 1;
    #1; a = 4'b1000; b = 4'b0111; cin = 1;
    #1; a = 4'd3;    b = 4'd6;    cin = 0;

    // Exhaustive verification using nested loops
    for (i = 0; i < 16; i = i + 1) begin
      for (j = 0; j < 16; j = j + 1) begin
        for (k = 0; k < 2; k = k + 1) begin
          #1; a = i; b = j; cin = k;
        end
      end
    end
  end

endmodule