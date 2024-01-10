module top_module (
    input [15:0] scancode,
    output reg left,
    output reg down,
    output reg right,
    output reg up  );
    always_comb begin
        up = 1'b0;
        down = 1'b0;
        left = 1'b0;
        right = 1'b0;
        unique case (scancode)
            16'he06b:begin
                left = 1'b1;
            end
            16'he072:begin
                down = 1'b1;
            end
            16'he074:begin
                right = 1'b1;
            end
            16'he075:begin
                up = 1'b1;
            end
            default: ;
        endcase
    end
endmodule
