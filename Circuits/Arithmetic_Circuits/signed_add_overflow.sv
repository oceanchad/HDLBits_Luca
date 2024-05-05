// 如何檢測有號整數加法發生 overflow ？

// 如果 x 和 y 都在有號整數合理範圍內，假設 s = x+y ，若且為若 x>0, y>0 ，但 s <= 0 時，代表計算 w 時發生 positive overflow 。
// 如果 x 和 y 都在有號整數合理範圍內，假設 s = x+y ，若且為若 x<0, y<0 ，但 s >= 0 時，代表計算 w 時發生 negative overflow 。


module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); //

    assign s = a + b;
    assign overflow = (a[7] && b[7] && ~s[7]) || ~a[7] && ~b[7] && s[7];

endmodule
