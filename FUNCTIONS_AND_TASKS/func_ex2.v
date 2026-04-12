module func_ex2 ();

    // function to compare 2 integers
    function compare (input integer a, input integer b);
        compare = (a == b);
    endfunction

    // stimulus
    integer a, b;

    initial begin
        $monitor($time, " a = %d b = %d compare = %d", a, b, compare(a,b));

        repeat (30) begin
            #1;
            a = $urandom;
            b = $urandom;
        end
    end

endmodule