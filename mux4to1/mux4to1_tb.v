module mux4to1_tb;
    reg in0, in1, in2, in3, s1, s0;
    output out;
    mux4to1 mux4to1_inst (
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .s1(s1),
        .s0(s0),
        .out(out)
    );
    initial begin
        $dumpfile("mux4to1_tb.vcd");
        $dumpvars(0, mux4to1_tb);
        $monitor("in0=%b, in1=%b, in2=%b, in3=%b, s1=%b, s0=%b, out=%b\n", in0, in1, in2, in3, s1, s0, out);
        $display("Case 1");
        in0 = 1'b1;
        in1 = 1'b0;
        in2 = 1'b0;
        in3 = 1'b0;
        s1 = 1'b0;
        s0 = 1'b0;
        #10;
        $display("Case 2");
        in0 = 1'b0;
        in1 = 1'b1;
        in2 = 1'b0;
        in3 = 1'b0;
        s1 = 1'b0;
        s0 = 1'b1;
        #10;
        $display("Case 3");
        in0 = 1'b0;
        in1 = 1'b0;
        in2 = 1'b1;
        in3 = 1'b0;
        s1 = 1'b1;
        s0 = 1'b0;
        #10;
        $display("Case 4");
        in0 = 1'b0;
        in1 = 1'b0;
        in2 = 1'b0;
        in3 = 1'b1;
        s1 = 1'b1;
        s0 = 1'b1;
        #10;
        $finish;
    end
endmodule