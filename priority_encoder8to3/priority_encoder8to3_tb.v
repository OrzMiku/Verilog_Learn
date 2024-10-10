`timescale 1ns/1ps
module priority_encoder8to3_tb;
    reg [7:0] in;
    wire [2:0] out;

    priority_encoder8to3 priority_encoder8to3_inst (
        .in(in),
        .out(out)
    );

    initial begin
        $dumpfile("priority_encoder8to3_tb.vcd");
        $dumpvars(0, priority_encoder8to3_tb);
        $monitor("in=%b, out=%b\n", in, out);
        $display("Case 1");
        in = 8'b11111111;
        #10;
        $display("Case 2");
        in = 8'b01111111;
        #10;
        $display("Case 3");
        in = 8'b00111111;
        #10;
        $display("Case 4");
        in = 8'b00011111;
        #10;
        $display("Case 5");
        in = 8'b00001111;
        #10;
        $display("Case 6");
        in = 8'b00000111;
        #10;
        $display("Case 7");
        in = 8'b00000011;
        #10;
        $display("Case 8");
        in = 8'b00000001;
        #10;
        $finish;
    end
endmodule