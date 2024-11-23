module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah );

    localparam LEFT = 0, RIGHT = 1, FALL_L = 2, FALL_R = 3;

    reg [1:0] state, next_state;

    always@(posedge clk or posedge areset) begin
        if (areset)
            state <= LEFT;
        else
            state <= next_state;
    end

    /* state transition logic */
    always@(*) begin
        case(state)
            LEFT :
                next_state = (ground == 1'b0) ? FALL_L : (bump_left ? RIGHT : LEFT);
            RIGHT :
                next_state = (ground == 1'b0) ? FALL_R : (bump_right ? LEFT : RIGHT);
            FALL_L :
                next_state = (ground == 1'b0) ? FALL_L : LEFT;
            FALL_R :
                next_state = (ground == 1'b0) ? FALL_R : RIGHT;
        endcase
    end

    /* output logic */
    assign walk_right = (state == RIGHT);
    assign walk_left = (state == LEFT);
    assign aaah = (state == FALL_L || state == FALL_R);

endmodule
