`timescale 1us/1ns
module func_ex3 ();
 
    //recursive function
    function automatic integer factorial (input integer N);
    begin
        if (N == 0)
            factorial = 1;
        else
            factorial = N * factorial(N-1);
    end
endfunction

initial begin
    #1; $display($time, " factorial(2) = %d" , factorial(2));
    #1; $display($time, " factorial(6) = %d" , factorial(6));
    #1; $display($time, " factorial(9) = %d" , factorial(9));
    #1; $display($time, " factorial(10) = %d" , factorial(10));
end


endmodule