module top_module1 (input x, input y, output z);
    wire ia1, ib1, ia2, ib2;
    assign ia1 = (x ^ y) & x;
    assign ib1 = (x == y) ? 1 : 0;
    assign ia2 = (x ^ y) & x;
    assign ib2 = (x == y) ? 1 : 0;

    assign z = (ia1 | ib1 ) ^ (ia2 & ib2);
endmodule

// better
module top_module (input x, input y, output z);
    wire ia1, ib1, ia2, ib2;
    A a1(x, y, ia1);
    B b1(x, y, ib1);
    A a2(x, y, ia2);
    B b2(x, y, ib2);

    assign z = (ia1 | ib1) ^ (ia2 & ib2);

endmodule

module A (input x, input y, output z);
    assign z = (x ^ y) & x;
endmodule

module B ( input x, input y, output z );
    assign z = (x == y) ? 1 : 0;
endmodule
