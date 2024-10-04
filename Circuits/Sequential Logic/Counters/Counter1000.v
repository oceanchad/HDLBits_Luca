module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //
    wire [3:0] c1, c10, c100;

    assign c_enable = {c1 == 9 && c10 == 9, c1 == 9, 1'b1};
    assign OneHertz = c1 == 9 && c10 == 9 && c100 == 9;

    bcdcount counter0 (clk, reset, c_enable[0], c1);
    bcdcount counter1 (clk, reset, c_enable[1], c10);
    bcdcount counter2 (clk, reset, c_enable[2], c100);

endmodule
