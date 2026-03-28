module  pri_enc_4to2_tb ();
    //declare variables
    reg [3:0] x;
    wire [1:0] y;
    wire v;


    //instantiate the DUT
    pri_enc_4to2 pri_ENC (
        .a(x),
        .q(y),
        .x(v)
    );


    //monitor values
    initial begin
        $display("4 to 2 Priority Encoder");
        $monitor("x = %b y = %d v = %b", x, y, v);
    end

    //generate random test
    initial begin
        repeat (10) begin
            //generate an unsigned 32bit no. but bask to last 4 bits
            x = $random & (4'b1111);
            #10;
        end
    end
    
endmodule