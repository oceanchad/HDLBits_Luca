// Code your testbench here
// or browse Examples
module tb;
  initial begin
    user_packet up = new();
    t = new();
    repeat(10) begin
      if (!up.randomize())
        $error("up randomization failure");
      else
        $display("up.data is %0d", up.data);
    end
    if (t.randomize())
        $error("t randomization failure");
    else
        $display("t.data is %0d", t.addr);
  end
endmodule