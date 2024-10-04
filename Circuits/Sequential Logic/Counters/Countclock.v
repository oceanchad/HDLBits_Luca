module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss);

    reg [3:0] hh_10, hh_01, mm_10, mm_01, ss_10, ss_01;
    wire hour_change, hour_reset, pm_change;

    assign hh = {hh_10, hh_01};
    assign mm = {mm_10, mm_01};
    assign ss = {ss_10, ss_01};
    assign pm = pm_change;

    always @(posedge clk) begin
        if (reset || (ena && ss_01 == 9))
            ss_01 <= 0;
        else if (ena)
            ss_01 <= ss_01 + 1;
    end

    always @(posedge clk) begin
        if (reset || (ena && ss_01 == 9 && ss_10 == 5))
            ss_10 <= 0;
        else if (ena && ss_01 == 9)
            ss_10 <= ss_10 + 1;
    end

    always @(posedge clk) begin
        if (reset || (ena && ss_01 == 9 && ss_10 == 5 && mm_01 == 9))
            mm_01 <= 0;
        else if (ena && ss_01 == 9 && ss_10 == 5)
            mm_01 <= mm_01 + 1;
    end

    always @(posedge clk) begin
        if (reset || (ena && ss_01 == 9 && ss_10 == 5 && mm_01 == 9 && mm_10 == 5))
            mm_10 <= 0;
        else if (ena && ss_01 == 9 && ss_10 == 5 && mm_01 == 9)
            mm_10 <= mm_10 + 1;
    end

    assign hour_change = (ss_01 == 9 && ss_10 == 5 && mm_01 == 9 && mm_10 == 5 && hh_01 == 9 && hh_10 == 0);
    assign hour_reset = (ss_01 == 9 && ss_10 == 5 && mm_01 == 9 && mm_10 == 5 && hh_01 == 2 && hh_10 == 1);

    // hour ones bit
    always @(posedge clk) begin
        if (reset)
            hh_01 <= 2; // 12
        else if (ena && hour_change)
            hh_01 <= 0; // 09 -> 10
        else if (ena && hour_reset)
            hh_01 <= 1; // 12 -> 01
        else if (ena && ss_01 == 9 && ss_10 == 5 && mm_01 == 9 && mm_10 == 5)
            hh_01 <= hh_01 + 1;
    end

    // hour tens bit
    always @(posedge clk) begin
        if (reset)
            hh_10 <= 1; // 12
        else if (ena && hour_reset)
            hh_10 <= 0; // 12 -> 01
        else if (ena && ss_01 == 9 && ss_10 == 5 && mm_01 == 9 && mm_10 == 5 && hh_01 == 9)
            hh_10 <= hh_10 + 1;
    end

    // am or pm
    always @(posedge clk) begin
        if (reset)
            pm_change <= 0;
        else if (ena && ss_01 == 9 && ss_10 == 5 && mm_01 == 9 && mm_10 == 5 && hh_01 == 1 && hh_10 == 1)
            pm_change <= ~pm_change;
    end



endmodule
