module encoder8to3_tb ();

//declare variables
reg [7:0] a;
reg enable;
wire [2:0] b;

//for verification
integer  i;

//instantiate DUT
encoder_8to3 ENC (
    .d(a),
    .enable(enable),
    .y(b)
);

//monitor values
initial begin
    $display("8 to 3 Encoder");
    $monitor("a = %b enable = %b b = %b", a , enable, b);
end

//generate stimulus 
initial begin
    
    for (i = 0; i < 8; i = i + 1) begin
        #1;
        enable = 1;
        #1; 
        a = 1 << i;
      
    end
end




endmodule