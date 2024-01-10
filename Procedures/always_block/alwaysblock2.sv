module top_module(
    input clk,
    input a,
    input b,
    output wire out_assign,
    output reg out_always_comb,
    output reg out_always_ff   );

    assign out_assign = a ^ b;

    always_comb begin
        out_always_comb = a ^ b;
    end

    always_ff @( posedge clk ) begin
        out_always_ff <= a ^ b;
    end
endmodule