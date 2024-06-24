module top_module (
    input [3:0] x,
    input [3:0] y,
    output [4:0] sum);

    wire fadd12, fadd23, fadd34;

    fadder f_add1(
        .a(x[0]),
        .b(y[0]),
        .cin(0),
        .sum(sum[0]),
        .cout(fadd12)
    );

    fadder f_add2(
        .a(x[1]),
        .b(y[1]),
        .cin(fadd12),
        .sum(sum[1]),
        .cout(fadd23)
    );

    fadder f_add3(
        .a(x[2]),
        .b(y[2]),
        .cin(fadd23),
        .sum(sum[2]),
        .cout(fadd34)
    );

    fadder f_add4(
        .a(x[3]),
        .b(y[3]),
        .cin(fadd34),
        .sum(sum[3]),
        .cout(sum[4])
    );

endmodule


module fadder(
    input a, b, cin,
    output cout, sum );

    assign {cout, sum} = a + b + cin;

endmodule

// easy way
module top_module (
    input [3:0] x,
    input [3:0] y,
    output [4:0] sum);

    assign sum = (x + y);

endmodule
