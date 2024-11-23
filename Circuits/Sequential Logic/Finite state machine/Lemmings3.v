module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging );

    localparam LEFT = 0, RIGHT = 1, FALL_L = 2, FALL_R = 3, DIG_L = 4, DIG_R = 5;

    reg [2:0] state, next_state;

    always@(posedge clk or posedge areset) begin
        if (areset)
            state <= LEFT;
        else
            state <= next_state;
    end

    /* state transition logic */
    always@(*) begin
        case(state)
            LEFT : begin
                if (ground == 1'b0)
                    next_state = FALL_L;
                else if (dig == 1'b1)
                    next_state = DIG_L;
                else if (bump_left)
                    next_state = RIGHT;
                else
                    next_state = LEFT;
            end
            RIGHT : begin
                if (ground == 1'b0)
                    next_state = FALL_R;
                else if (dig == 1'b1)
                    next_state = DIG_R;
                else if (bump_right)
                    next_state = LEFT;
                else
                    next_state = RIGHT;
            end
            FALL_L :
                next_state = (ground == 1'b0) ? FALL_L : LEFT;
            FALL_R :
                next_state = (ground == 1'b0) ? FALL_R : RIGHT;
            DIG_L:
                next_state = (ground == 1'b1) ? DIG_L : FALL_L;
            DIG_R:
                next_state = (ground == 1'b1) ? DIG_R : FALL_R;

        endcase
    end

    /* output logic */
    assign walk_right = (state == RIGHT);
    assign walk_left = (state == LEFT);
    assign aaah = (state == FALL_L || state == FALL_R);
    assign digging = (state == DIG_L || state == DIG_R);

endmodule
