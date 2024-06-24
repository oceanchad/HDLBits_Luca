module top_module (
    input clk,
    input x,
    output z
);
    wire Q1, Q2, Q3;
    wire iQ2, iQ3;
    D_ff dff1(
        .clk(clk),
        .D(x ^ Q1),
        .Q(Q1),
        .iQ()
    );
    D_ff dff2(
        .clk(clk),
        .D(x & iQ2),
        .Q(Q2),
        .iQ(iQ2)
    );
    D_ff dff3(
        .clk(clk),
        .D(x | iQ3),
        .Q(Q3),
        .iQ(iQ3)
    );

    assign z = ~(Q1 | Q2 | Q3);

endmodule

module D_ff(
    input clk,
    input D,
    output Q,
    output iQ
);
    assign iQ = ~Q;
    always @(posedge clk) begin
        Q <= D;
    end
endmodule

