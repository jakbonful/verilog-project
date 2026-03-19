module testbench1 ();
  reg [3:0] a, b;
  reg cin;
  wire [3:0] sum;
  wire cout;

  // variables for verification 
  integer i, j, k;

  //instantiate the DUT ie ripple_dataflow
  ripple_dataflow TEST(
    .a(a),
    .b(b),
    .carry_in(cin),
    .sum(sum),
    .carry_out(cout)
  );


  //monitor output and generate stimilus
  always @(*) begin
    $display("a = %0d, b = %0d, cin = %0b, sum = %0d, cout = %b" , a, b, cin, sum, cout);
  end


  initial begin
    //verify all posible combinations
    for (i =0; i < 4; i = i + 1) begin
      for (j = 0; j < 4; j= j + 1) begin
        for(k = 0; k < 2; k= k + 1) begin
          #1; a = i; b = j; cin = k; 
        end
      end
    end
  end
endmodule
