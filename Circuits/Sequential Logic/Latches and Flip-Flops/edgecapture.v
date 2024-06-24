module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    // 2 -> e
    // 0010 -> 1110
    // e -> 0
    // 1110 -> 0
    reg [31:0] in_reg;

    always@(posedge clk) begin
        in_reg <= in;
    end

    always@(posedge clk) begin
        if (reset)
            out <= 32'h0000;
        else begin
            out <= (~in & in_reg) | out;
        end
    end
endmodule
