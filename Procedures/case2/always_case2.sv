module top_module (
    input [3:0] in,
    output reg [1:0] pos  );

    always_comb begin
        /* method 1 */
        // case (in)
        //     4'b0000: pos = 2'b00;
        //     4'b0001: pos = 2'b00;
        //     4'b0010: pos = 2'b01;
        //     4'b0011: pos = 2'b00;
        //     4'b0100: pos = 2'b10;
        //     4'b0101: pos = 2'b00;
        //     4'b0110: pos = 2'b01;
        //     4'b0111: pos = 2'b00;
        //     4'b1000: pos = 2'b11;
        //     4'b1001: pos = 2'b00;
        //     4'b1010: pos = 2'b01;
        //     4'b1011: pos = 2'b00;
        //     4'b1100: pos = 2'b10;
        //     4'b1101: pos = 2'b00;
        //     4'b1110: pos = 2'b01;
        //     4'b1111: pos = 2'b00;
        //     default: pos = 2'b00;
        // endcase
        /* method 2 */
        // case (in)
        //     4'h0: pos = 2'h0;
        //     4'h1: pos = 2'h0;
        //     4'h2: pos = 2'h1;
        //     4'h3: pos = 2'h0;
        //     4'h4: pos = 2'h2;
        //     4'h5: pos = 2'h0;
        //     4'h6: pos = 2'h1;
        //     4'h7: pos = 2'h0;
        //     4'h8: pos = 2'h3;
        //     4'h9: pos = 2'h0;
        //     4'ha: pos = 2'h1;
        //     4'hb: pos = 2'h0;
        //     4'hc: pos = 2'h2;
        //     4'hd: pos = 2'h0;
        //     4'he: pos = 2'h1;
        //     4'hf: pos = 2'h0;
        //     default: pos = 2'b0;
        // endcase
        /* method 3 */
        case (1'b1)
            in[0]:begin
                pos = 2'd0;
            end
            in[1]:begin
                pos = 2'd1;
            end
            in[2]:begin
                pos = 2'd2;
            end
            in[3]:begin
                pos = 2'd3;
            end
            default:begin
                pos = 2'd0;
            end

        endcase
    end
endmodule
