// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//
    reg out;

    // Fill in state name declarations
    localparam A = 0;
    localparam B = 1;

    reg present_state, next_state;

    // Fill in state transition logic
    always@(*) begin
        case (present_state)
            A : next_state = (in) ? A : B;
            B : next_state = (in) ? B : A;
        endcase
    end

    always @(posedge clk) begin
        if (reset) begin
            present_state <= B;
            // Fill in reset logic
        end else begin
            // State flip-flops
            present_state <= next_state;
        end
    end

    always@(*) begin
        case (present_state)
        // Fill in output logic
            A : out = 0;
            B : out = 1;

        endcase
    end

endmodule
