module top_module(
    input [3:0] in,
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different );

    assign out_both[2] = in[3] & in[2];
    assign out_both[1] = in[2] & in[1];
    assign out_both[0] = in[1] & in[0];

    assign out_any[3] = in[3] | in[2];
    assign out_any[2] = in[2] | in[1];
    assign out_any[1] = in[1] | in[0];

    assign out_different[3] = in[0] ^ in[3];
    assign out_different[2] = in[3] ^ in[2];
    assign out_different[1] = in[2] ^ in[1];
    assign out_different[0] = in[1] ^ in[0];

endmodule

// better
module top_module(
    input [3:0] in,
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different
);

    genvar i;

    generate
        for (i = 0; i < 3; i = i + 1) begin : gen_out_both
            assign out_both[i] = in[i + 1] & in[i];
        end

        for (i = 1; i < 4; i = i + 1) begin: gen_out_any
            assign out_any[i] = in[i] | in[i-1];
        end

        for (i = 0; i < 4; i = i + 1) begin: gen_out_different
            assign out_different[i] = in[(i + 1) % 4] ^ in[i];
        end
    endgenerate

endmodule

