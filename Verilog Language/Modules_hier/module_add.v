module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire a1cout;
    add16 a1(
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(0),
        .sum(sum[15:0]),
        .cout(a1cout),
    );
    add16 a2(
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(a1cout),
        .sum(sum[31:16]),
    );

endmodule
