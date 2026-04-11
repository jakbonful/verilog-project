module func_ex1 ();

    // function returns sum of 2 8-bit numbers
    function [8:0] sum (input [7:0] a, input [7:0] b);
        sum = a + b;
    endfunction  

    // stimulus variables
    reg [7:0] a, b;

    initial begin
        $monitor($time, " a = %d b = %d sum = %d", a, b, sum(a,b));

        #1; a = 8'd1;   b = 8'd9;
        #1; a = 8'd13;  b = 8'd66; 
        #1; a = 8'd255; b = 8'd1;
        #1; a = 8'd255; b = 8'd255;
    end

endmodule