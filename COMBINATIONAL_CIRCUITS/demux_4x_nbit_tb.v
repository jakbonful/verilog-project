`timescale 1us/1ns

module demux_4x_nbit_tb ();

// parameters
parameter BUS_WIDTH = 8;

// signals
reg [BUS_WIDTH-1:0] x;
reg [1:0] sel;

wire [BUS_WIDTH-1:0] a, b, c, d;

integer i;

// DUT
demux_4x_nbit #(.BUS_WIDTH(BUS_WIDTH)) nDEMUX (
    .y(x),
    .selector(sel),
    .a(a),
    .b(b),
    .c(c),
    .d(d)
);

// monitor
initial begin
    $display("4 DEMUX TEST");
    $monitor("t = %0t sel = %d x = %d | a = %d b = %d c = %d d = %d",
              $time, sel, x, a, b, c, d);
end

// stimulus + checking (race-free)
initial begin
    sel = 0;
    x   = 0;
    #1;

    for (i = 0; i < 10; i = i + 1) begin
        #1;
        sel = $urandom % 4;
        x   = $urandom & ((1<<BUS_WIDTH)-1);

        #0; // wait one delta cycle (CRITICAL)

        // check outputs
        case (sel)
            2'd0: begin
                if (a !== x || b !== 0 || c !== 0 || d !== 0)
                    $error("FAIL sel=0");
            end

            2'd1: begin
                if (b !== x || a !== 0 || c !== 0 || d !== 0)
                    $error("FAIL sel=1");
            end

            2'd2: begin
                if (c !== x || a !== 0 || b !== 0 || d !== 0)
                    $error("FAIL sel=2");
            end

            2'd3: begin
                if (d !== x || a !== 0 || b !== 0 || c !== 0)
                    $error("FAIL sel=3");
            end
        endcase
    end

    $display("TEST COMPLETED");

end

endmodule