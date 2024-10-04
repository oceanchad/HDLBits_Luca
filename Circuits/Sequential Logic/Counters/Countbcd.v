module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);

    reg [3:0] c1, c10, c100, c1000;

    assign q = {c1000, c100, c10, c1};
    assign ena[1] = (c1 == 9) ? 1 : 0;
    assign ena[2] = (c1 == 9 && c10 == 9) ? 1 : 0;
    assign ena[3] = (c1 == 9 && c10 == 9 && c100 == 9) ? 1 : 0;

    always @(posedge clk) begin
        if (reset || c1 == 9)
            c1 <= 0;
        else
            c1 <= c1 + 1;
    end

    always @(posedge clk) begin
        if (reset || (c1 == 9 && c10 == 9))
            c10 <= 0;
        else if (c1 == 9)
            c10 <= c10 + 1;
    end

    always @(posedge clk) begin
        if (reset || (c1 == 9 && c10 == 9 && c100 == 9))
            c100 <= 0;
        else if (c1 == 9 && c10 ==9)
            c100 <= c100 + 1;
    end

    always @(posedge clk) begin
        if (reset || (c1 == 9 && c10 == 9 && c100 == 9 && c1000 == 9))
            c1000 <= 0;
        else if (c1 == 9 && c10 == 9 && c100 == 9)
            c1000 <= c1000 + 1;
    end

endmodule
