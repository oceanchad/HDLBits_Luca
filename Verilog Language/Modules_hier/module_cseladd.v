module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire sel;
    wire [15:0] a2_sum, a3_sum;

    add16 a1(
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(0),
        .sum(sum[15:0]),
        .cout(sel),
    );

    add16 a2(
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(0),
        .sum(a2_sum),
    );

    add16 a3(
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1),
        .sum(a3_sum),
    );

    assign sum[31:16] = sel ? a3_sum : a2_sum;


endmodule
