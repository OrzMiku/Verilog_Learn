module comp_tb #(parameter N = 8);
    reg [N-1:0] in0, in1;
    wire gt, eq, lt;

    comp comp_inst (
        .in0(in0),
        .in1(in1),
        .gt(gt),
        .eq(eq),
        .lt(lt)
    );

    initial begin
        $dumpfile("comp_tb.vcd");
        $dumpvars(0, comp_tb);
        $monitor("in0=%b, in1=%b, gt=%b, eq=%b, lt=%b\n", in0, in1, gt, eq, lt);
        $display("Case 1");
        in0 = 8'b00000001;
        in1 = 8'b00000000;
        #10;
        $display("Case 2");
        in0 = 8'b00000000;
        in1 = 8'b00000001;
        #10;
        $display("Case 3");
        in0 = 8'b00000000;
        in1 = 8'b00000000;
        #10;
        $finish;
    end
endmodule