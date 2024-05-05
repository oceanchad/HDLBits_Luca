module top_module(
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum
);
    wire logic cout_tmp[3:0];

    bcd_fadd bcd_u1(
        .a(a[3:0]),
        .b(b[3:0]),
        .cin(cin),
        .cout(cout_tmp[0]),
        .sum(sum[3:0])
    );
    bcd_fadd bcd_u2(
        .a(a[7:4]),
        .b(b[7:4]),
        .cin(cout_tmp[0]),
        .cout(cout_tmp[1]),
        .sum(sum[7:4])
    );
    bcd_fadd bcd_u3(
        .a(a[11:8]),
        .b(b[11:8]),
        .cin(cout_tmp[1]),
        .cout(cout_tmp[2]),
        .sum(sum[11:8])
    );
    bcd_fadd bcd_u4(
        .a(a[15:12]),
        .b(b[15:12]),
        .cin(cout_tmp[2]),
        .cout(cout_tmp[3]),
        .sum(sum[15:12])
    );
    assign cout = cout_tmp[3];

endmodule