`timescale 1ns/1ps

module counter1_tb;

  reg [7:0] data;
  reg load, clk, reset;
  wire [7:0] out;

  // Instantiate the counter1 module
  counter1 uut (
    .out(out),
    .data(data),
    .load(load),
    .reset(reset),
    .clk(clk)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Testbench stimulus
  initial begin
    $dumpfile("counter1_tb.vcd");
    $dumpvars(0, counter1_tb);

    // Apply reset
    reset = 1;
    #10 reset = 0;

    // Test 1: Increment by 1
    data = 8'h00;
    load = 0;
    #20 load = 1;
    #50 load = 0;

    // Test 2: Load a new value
    data = 8'h0A;
    #20 load = 1;
    #50 load = 0;

    // Test 3: Reset
    #20 reset = 1;
    #10 reset = 0;

    // Test 4: Increment after reset
    #20 load = 1;
    #50 load = 0;

    #100 $finish;
  end

endmodule
