`timescale 1us/1ns

module fibonacci ();

    //fibonacci sequence
    function automatic integer fibonacci (input integer N);
        begin
            if (N == 0) begin
                fibonacci = 0;
            end 
            else if (N == 1) begin
                fibonacci = 1;
            end 
            else
                fibonacci = fibonacci (N-1) + fibonacci(N-2);
        end        
    endfunction

    initial begin
        #1; $display($time, " fibonacci(5) = %d", fibonacci(5));
        #1; $display($time, " fibonacci(9) = %d", fibonacci(9));
        #1; $display($time, " fibonacci(7) = %d", fibonacci(7));
        #1; $display($time, " fibonacci(6) = %d", fibonacci(6));
        #1; $display($time, " fibonacci(10) = %d", fibonacci(10));
    end

endmodule