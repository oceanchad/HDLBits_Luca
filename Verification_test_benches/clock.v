module top_module ( );

    reg clk;

    dut d(clk);

    initial begin
        clk <= 0;
        forever begin
            #5 clk <= !clk;
        end
    end

endmodule
