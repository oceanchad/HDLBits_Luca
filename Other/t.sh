iverilog -g2012 -o test test.v counter1_tb.v
vvp test
gtkwave counter1_tb.vcd