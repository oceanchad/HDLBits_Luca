module top_module(
    input in,
    input [1:0] state,
    output [1:0] next_state,
    output out); //

    parameter A=0, B=1, C=2, D=3;

    // State transition logic: next_state = f(state, in)
    always@(*) begin
        case(state)
            A : next_state = (in == 0) ? A : B;
            B : next_state = (in == 0) ? C : B;
            C : next_state = (in == 0) ? A : D;
            D : next_state = (in == 0) ? C : B;
        endcase
    end


    // Output logic:  out = f(state) for a Moore state machine
    always@(*) begin
        case (state)
            D : out = 1;
            default : out = 0;
        endcase
    end

endmodule
