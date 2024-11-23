module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //

    reg [3:0] state, next_state;
    localparam IDLE = 0, S1 = 1, S2 = 2, S3 = 3;

    // State transition logic (combinational)
    always@(*) begin
        case(state)
            IDLE : next_state = in[3] ? S1 : IDLE;
            S1 : next_state = S2;
            S2 : next_state = S3;
            S3 : next_state = in[3] ? S1 : IDLE;
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
    assign done = state == S3;

endmodule
