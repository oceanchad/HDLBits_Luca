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

    localparam LEFT = 0, RIGHT = 1, FALL_L = 2, FALL_R = 3, DIG_L = 4, DIG_R = 5, SPLATTER = 6;

    reg [2:0] state, next_state;
    reg [9:0] cnt;

    always@(posedge clk or posedge areset) begin
        if (areset)
            state <= LEFT;
        else if (state == FALL_L || state == FALL_R) begin
            state <= next_state;
            cnt <= cnt + 1;
        end else begin
            state <= next_state;
            cnt <= 0;
        end
    end

    always@(*) begin
        case (state)
            LEFT: begin
                if (ground == 0)
                    next_state = FALL_L;
                else if (dig)
                    next_state = DIG_L;
                else if (bump_left)
                    next_state = RIGHT;
                else
                    next_state = LEFT;
            end
            RIGHT : begin
                if (ground == 0)
                    next_state = FALL_R;
                else if (dig)
                    next_state = DIG_R;
                else if (bump_right)
                    next_state = LEFT;
                else
                    next_state = RIGHT;
            end
            FALL_L : begin
                if (ground == 0)
                    next_state = FALL_L;
                else if (cnt > 8'd19)
                    next_state = SPLATTER;
                else
                    next_state = LEFT;
            end
            FALL_R : begin
                if (ground == 0)
                    next_state = FALL_R;
                else if (cnt > 8'd19)
                    next_state = SPLATTER;
                else
                    next_state = RIGHT;
            end
            DIG_L : begin
                if (ground == 0)
                    next_state = FALL_L;
                else
                    next_state = DIG_L;
            end
            DIG_R : begin
                if (ground == 0)
                    next_state = FALL_R;
                else
                    next_state = DIG_R;
            end
            SPLATTER : begin
                next_state = SPLATTER;
            end
            default :
                next_state = LEFT;
        endcase
    end

    assign walk_left = state == LEFT;
    assign walk_right = state == RIGHT;
    assign aaah = state == FALL_L || state == FALL_R;
    assign digging = state == DIG_L || state == DIG_R;


endmodule
