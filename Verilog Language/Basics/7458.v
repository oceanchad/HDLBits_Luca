module top_module (
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );

    wire p2ab, p2cd, p1acb, p1fed;
    assign p2ab = p2a & p2b;
    assign p2cd = p2c & p2d;
    assign p1acb = p1a & p1c & p1b;
    assign p1fed = p1f & p1e & p1d;
    assign p2y = p2ab | p2cd;
    assign p1y = p1acb | p1fed;

endmodule
