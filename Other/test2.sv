module moduleName (
);
    string s;
    initial begin
        s = "IEEE ";
        $display(s.getc(0));
    end
endmodule