module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //

    // FSM from fsm_ps2
    reg [3:0] state, next_state;
    localparam IDLE = 0, S1 = 1, S2 = 2, S3 = 3;

    // State transition logic (combinational)
    always@(*) begin
        case(state)
            IDLE : next_state = in[3] ? S1 : IDLE;
            S1 : begin
                next_state = S2;
            end
            S2 : begin
                next_state = S3;
            end
            S3 : begin
                next_state = in[3] ? S1 : IDLE; // Go back to IDLE or continue on next new message transaction
            end
            default : next_state = IDLE;
        endcase
    end

    // State flip-flops (sequential)
    always @(posedge clk) begin
        if (reset)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Output logic
	always@(posedge clk) begin
        if (reset) begin
            done <= 0;
            out_bytes <= 24'b0;
        end else begin
            case(next_state)
                S1 : begin
                    out_bytes[23:16] <= in;
                    done <= 0;
                end
                S2 : begin
                    out_bytes[15:8] <= in;
                    done <= 0;
                end
                S3 : begin
                    out_bytes[7:0] <= in;
                    done <= 1;
                end
                default : done <= 0;
            endcase
        end
    end

endmodule
