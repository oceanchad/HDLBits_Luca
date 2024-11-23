module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
);
    // 1 start bit | 8 data bits | 1 stop bit

    reg [3:0] state, next_state;
    /*
        IDLE : initial status, in == 0 -> START
        START : counting status, counter == 7 -> STOP
        STOP : stop status, in == 1 -> IDLE
            in == 0 (cannot find stop bit) -> STOP_SEARCH
        STOP_SEARCH : find stop bit status, in == 1 -> IDLE
            in == 0 (keep find stop bit) -> STOP_SEARCH

    */
    localparam IDLE = 0, START = 1, DATA = 2 ,STOP = 3, STOP_SEARCH = 4;

    reg [3:0] counter;

    always @(posedge clk) begin
        if (reset)
            state <= IDLE;
        else
            state <= next_state;
    end

    always@(*) begin
        case(state)
            IDLE : next_state = in == 0 ? START : IDLE;
            START : next_state = DATA;
            DATA: begin
                if (counter == 8) begin
                    if (in == 1)
                        next_state = STOP;
                    else
                        next_state = STOP_SEARCH;
                end
                else
                    next_state = DATA;
            end
            STOP : begin
                if (in == 1)
                    next_state = IDLE;
                else
                    next_state = START;
            end
            STOP_SEARCH : begin
                if (in == 1)
                    next_state = IDLE;
                else
                    next_state = STOP_SEARCH;
            end
            default : next_state = IDLE;
        endcase
    end

    always @(posedge clk) begin
        if (reset) begin
            done <= 0;
        end
        else begin
            case (next_state)
                STOP: done<=1;
                default: done<=0;
            endcase
        end
    end

    always @(posedge clk) begin
        if (reset) begin
            counter <= 0;
        end
        else begin
            case (next_state)
                START: counter<=0;
                DATA: counter<=counter+1;
                default: counter<=counter;
            endcase
        end
    end

endmodule
