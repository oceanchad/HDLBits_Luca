module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //


MUXDFF muxdff1(
    .clk(KEY[0]),
    .w(KEY[3]),
    .L(KEY[2]),
    .E(KEY[1]),
    .R(SW[3]),
    .Q(LEDR[3])
);
MUXDFF muxdff2(
    .clk(KEY[0]),
    .w(LEDR[3]),
    .L(KEY[2]),
    .E(KEY[1]),
    .R(SW[2]),
    .Q(LEDR[2])
);
MUXDFF muxdff3(
    .clk(KEY[0]),
    .w(LEDR[2]),
    .L(KEY[2]),
    .E(KEY[1]),
    .R(SW[1]),
    .Q(LEDR[1])
);

MUXDFF muxdff4(
    .clk(KEY[0]),
    .w(LEDR[1]),
    .L(KEY[2]),
    .E(KEY[1]),
    .R(SW[0]),
    .Q(LEDR[0])
);

endmodule

module MUXDFF (
    input clk,
    input w, R, E, L,
    output Q
);

    wire e_sel;
    assign e_sel = E ? w : Q;

    always @(posedge clk) begin
        Q <= (L) ? R : e_sel;
    end

endmodule