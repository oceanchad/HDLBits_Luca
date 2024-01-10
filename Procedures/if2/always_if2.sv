module top_module (
    input      cpu_overheated,
    output reg shut_off_computer,
    input      arrived,
    input      gas_tank_empty,
    output reg keep_driving  ); //

    // always_comb begin
    //     if (cpu_overheated)
    //         shut_off_computer = 1;
    //     else
    //         shut_off_computer = 0;
    // end

    // always_comb begin
    //     if (~arrived)
    //         keep_driving = ~gas_tank_empty;
    //     else
    //         keep_driving = 0;
    // end
    always_ff @( posedge clk or negedge rst_n ) begin
        if (!rst_n) begin
            shut_off_computer <= 0;
            keep_driving <= 0;
        end else begin
            if (cpu_overheated)
                shut_off_computer <= 1;
            else
                shut_off_computer <= 0;
            if (~arrived)
                keep_driving <= ~gas_tank_empty;
            else
                keep_driving <= 0;
        end
    end

endmodule
