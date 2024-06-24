module top_module (
    input d,
    input ena,
    output q);

    always@(ena or d) begin
        if (ena)
            q <= d;
    end

endmodule
