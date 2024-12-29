`timescale 1ns / 1ps
module Dff_rst_tb;
    reg clk;
    reg rst;
    reg d;
    wire q;

    Dff_rst Dff_rst_inst (
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q)
    );

    initial begin
        $dumpfile("Dff_rst_tb.vcd");
        $dumpvars(0, Dff_rst_tb);
        clk = 0;
        rst = 1;
        d = 0;
        #5 d = 1;
        #5 clk = 1;
        #5 d = 0;
        #5 clk = 0;
        #5 d = 1;
        #5 clk = 1;
        #5 rst = 0;
        #5 rst = 1;
        clk = 0;
        #5 d = 1;
        #5 clk = 1;
        #5 d = 0;
        #5 clk = 0;
        #5 clk = 1;
        #5 clk = 0;
        #5 $finish;
    end

endmodule