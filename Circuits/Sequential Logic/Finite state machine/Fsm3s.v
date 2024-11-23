module top_module(
    input clk,
    input in,
    input reset,
    output out); //

    localparam A = 0, B = 1, C = 2, D = 3;

    reg [1:0] state, next_state;

    // State transition logic
    always@(*) begin
        case(state)
            A : next_state = (in == 0) ? A : B;
            B : next_state = (in == 0) ? C : B;
            C : next_state = (in == 0) ? A : D;
            D : next_state = (in == 0) ? C : B;
        endcase
    end

    // State flip-flops with synchronous reset
    always @(posedge clk) begin
        if (reset)
            state <= A;
        else
            state <= next_state;

    end

    // Output logic
    assign out = (state == D) ? 1 : 0;

endmodule
