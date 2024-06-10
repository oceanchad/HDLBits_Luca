module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire a1_cout;
    wire [31:0] b_sub;

    assign b_sub = b ^ {32{sub}};

    add16 a1(
        .a(a[15:0]),
        .b(b_sub[15:0]),
        .cin(sub),
        .sum(sum[15:0]),
        .cout(a1_cout)
    );

    add16 a2(
        .a(a[31:16]),
        .b(b_sub[31:16]),
        .cin(a1_cout),
        .sum(sum[31:16])
    );
endmodule
