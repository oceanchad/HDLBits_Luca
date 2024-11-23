module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z );

    reg [1:0] state, next_state;
    localparam IDLE = 0, ONE = 1, TWO = 2'b10;

    always @(posedge clk or negedge aresetn) begin
        if (!aresetn)
            state <= IDLE;
        else
            state <= next_state;
    end

    always@(*) begin
        case(state)
            IDLE : next_state = x ? ONE : IDLE;
            ONE : next_state = x ? ONE : TWO;
            TWO : next_state = x ? ONE : IDLE;
        endcase
    end

    assign z = (state == TWO) && (x == 1);

endmodule
