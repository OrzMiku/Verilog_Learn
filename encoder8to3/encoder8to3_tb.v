`timescale 1ns/1ps
module encoder8to3_tb;
    reg [7:0] in;
    wire [2:0] out;

    encoder8to3 encoder8to3_inst (
        .in(in),
        .out(out)
    );

    initial begin
        $dumpfile("encoder8to3_tb.vcd");
        $dumpvars(0, encoder8to3_tb);
        $monitor("in=%b, out=%b\n", in, out);
        $display("Case 1");
        in = 8'b00000001;
        #10;
        $display("Case 2");
        in = 8'b00000010;
        #10;
        $display("Case 3");
        in = 8'b00000100;
        #10;
        $display("Case 4");
        in = 8'b00001000;
        #10;
        $display("Case 5");
        in = 8'b00010000;
        #10;
        $display("Case 6");
        in = 8'b00100000;
        #10;
        $display("Case 7");
        in = 8'b01000000;
        #10;
        $display("Case 8");
        in = 8'b10000000;
        #10;
        $finish;
    end
endmodule