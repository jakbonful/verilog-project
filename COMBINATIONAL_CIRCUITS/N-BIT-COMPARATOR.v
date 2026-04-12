module N_BIT_COMPARATOR
    // paremeter section
    #( parameter N = 4)(
    input [N-1:0] a,
    input [N-1:0] b,
    output reg  equal,
    output reg  greater,
    output reg  lesser
);

    //comparator computation
    function automatic [2:0] compare (input [N-1:0] a, input [N-1:0] b);
        begin
            compare = {
                (a > b), // greater than
                (a == b), // equal to
                (a < b)  // lesser than
            };
        end
        
    endfunction

    // RTL COMP
        always @(*) begin
            {greater, equal, lesser} = compare(a,b);
        end
endmodule