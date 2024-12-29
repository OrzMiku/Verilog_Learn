`timescale 1ns/1ps
module decoder3to8_tb;
    reg [2:0] in;
    wire [7:0] out;
    
    decoder3to8 decoder3to8_inst (
        .in(in),
        .out(out)
    );

    initial begin
        $dumpfile("decoder3to8_tb.vcd");
        $dumpvars(0, decoder3to8_tb);
        $monitor("in=%b, out=%b\n", in, out);
        $display("Case 1");
        in = 3'b000;
        #10;
        $display("Case 2");
        in = 3'b001;
        #10;
        $display("Case 3");
        in = 3'b010;
        #10;
        $display("Case 4");
        in = 3'b011;
        #10;
        $display("Case 5");
        in = 3'b100;
        #10;
        $display("Case 6");
        in = 3'b101;
        #10;
        $display("Case 7");
        in = 3'b110;
        #10;
        $display("Case 8");
        in = 3'b111;
        #10;
        $finish;
    end
endmodule