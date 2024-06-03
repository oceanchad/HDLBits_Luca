module top_module (
    input [7:0] in,
    output [31:0] out );

    localparam len = $bits(out) - $bits(in);

    assign out = {{len{in[7]}}, in};

endmodule
