module top_module(
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
    wire logic cout_tmp [99:0];
    genvar i;
    generate
        bcd_fadd b_init(
            .a(a[3:0]),
            .b(b[3:0]),
            .cin(cin),
            .cout(cout_tmp[0]),
            .sum(sum[3:0])
        );
        for (i = 4; i < 400; i = i + 4) begin: bcd_adder_block
            bcd_fadd bcd_cont(
                .a(a[i+3:i]),
                .b(b[i+3:i]),
                .cin(cout_tmp[i/4 - 1]),
                .cout(cout_tmp[i/4]),
                .sum(sum[i+3:i])
            );

        end
    endgenerate
    assign cout = cout_tmp[99];


endmodule

