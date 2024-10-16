`timescale 1ns / 1ps
module Dff_tb;
    reg clk;
    reg d;
    wire q;

    Dff Dff_inst (
        .clk(clk),
        .d(d),
        .q(q)
    );

    initial begin
        $dumpfile("Dff_tb.vcd");
        $dumpvars(0, Dff_tb);
        clk = 0;
        d = 0;
        #5 d = 1;
        #5 clk = 1;
        #5 d = 0;
        #5 clk = 0;
        #5 d = 1;
        #5 clk = 1;
        #5 d = 0;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 $finish;
    end

endmodule