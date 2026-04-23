`timescale 1us/1ns

module shift_reg_pipo_buggy_tb ();
    
    // testbench variables
        reg clk = 0;
        reg reset_n;
        reg  [1:0] delay;
        reg  [7:0] d;
        wire [7:0] q;

        integer success_count, error_count, test_count;
        integer i;

    // DUT
        shift_reg_pipo_buggy PIPO0(
            .clk(clk),
            .reset_n(reset_n),
            .data_in(d),
            .data_out(q)
        );

    // task1
        task load_check_pipo_reg ();
            begin
                @(posedge clk);
                d = $random & 8'b1111_1111;
                @(posedge clk);
                #0.1;               // delay so flipflop can assign  d
                compare_data(d, q);
            end
        endtask

    // task2
        task compare_data (input [7:0] expected_data, input [7:0] observed_data);
            begin
                if (expected_data === observed_data) begin
                     $display($time, " SUCCESS | expected_data = %b observed_data = %b", expected_data, observed_data);
                     success_count = success_count + 1;
                end 
                else begin
                     $display($time, " FAILURE | expected_data = %b observed_data = %b", expected_data, observed_data);
                     error_count = error_count + 1;
                end
                     test_count = test_count + 1;
            end
        endtask

    // clock
        always #0.5 clk = ~clk;

    // stimulus 
        initial begin
            #1;
            success_count = 0;
            error_count = 0;
            test_count = 0;
            reset_n = 0;
            d = 0;

            #1.2; 
            reset_n = 1;
            for (i  = 0; i < 10; i = i + 1) begin
                load_check_pipo_reg (); // run task1
                delay = $random & 2'b11; // random delay between 0 to 3 us
                #(delay) d = $random;
            end

        // display 
            $display($time, " TEST RESULTS\n success_count = %0d error_count = %0d test_count = %0d",
                                success_count, error_count, test_count);

            #40 $stop;
        end

endmodule