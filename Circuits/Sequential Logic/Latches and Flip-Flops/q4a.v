module top_module (
    input clk,
    input w, R, E, L,
    output Q
);

    wire e_sel;
    assign e_sel = E ? w : Q;

    always @(posedge clk) begin
        Q <= (L) ? R : e_sel;
    end

endmodule
