module top_module(
    input clk,
    input reset,    // Synchronous reset to OFF
    input j,
    input k,
    output out); //

    parameter OFF=0, ON=1;
    reg state, next_state;

    always @(*) begin
        // State transition logic
        case(state)
            OFF : next_state = (j == 0) ? OFF : ON;
            ON : next_state = (k == 0) ? ON : OFF;
        endcase
    end

    always @(posedge clk) begin
        // State flip-flops with synchronous reset
        if (reset)
            state <= OFF;
        else
            state <= next_state;
    end

    // Output logic
    // assign out = (state == ...);
    assign out = (state == OFF) ? 0 : 1;

endmodule