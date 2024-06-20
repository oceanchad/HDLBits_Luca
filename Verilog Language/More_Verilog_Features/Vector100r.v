module top_module(
    input [99:0] in,
    output [99:0] out
);
    always@(*) begin
        for (integer i = 0 ; i < $bits(in); i = i+1)
            out[i] = in[$bits(in) - i - 1];
    end

endmodule
