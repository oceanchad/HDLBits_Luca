module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);

    reg[4:0] state, next_state;
    localparam NONE = 0, ONE = 1, TWO = 2, THREE = 3, FOUR = 4, FIVE = 5, SIX = 6, ERROR = 7, FLAG = 8, DISCARD = 9;

    // State flip-flops with synchronous reset
    always@(posedge clk) begin
        if (reset)
            state <= NONE;
        else
            state <= next_state;
    end

    // State transition logic
    always@(*) begin
        case(state)
            NONE : next_state = in ? ONE : NONE;
            ONE : next_state = in ? TWO : NONE;
            TWO : next_state = in ? THREE : NONE;
            THREE : next_state = in ? FOUR : NONE;
            FOUR : next_state = in ? FIVE : NONE;
            FIVE : next_state = in ? SIX : DISCARD;
            SIX : next_state = in ? ERROR : FLAG;
            ERROR : next_state = in ? ERROR : NONE;
            FLAG : next_state = in ? ONE :NONE;
            DISCARD : next_state = in ? ONE : NONE;
        endcase
    end
    // Output logic
    assign disc = (state == DISCARD);
    assign flag = (state == FLAG);
    assign err = (state == ERROR);

endmodule
