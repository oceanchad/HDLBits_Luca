module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); //

    count4 the_counter (clk, c_enable, c_load, c_d, Q);

endmodule

module count4(
	input clk,
	input enable,
	input load,
	input [3:0] d,
	output reg [3:0] Q
);

endmodule