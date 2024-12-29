module comp #(parameter N = 8) (
    input [N-1: 0] in0,
    input [N-1: 0] in1,
    output reg gt, eq, lt
);
    always @* begin
        gt = 1'b0;
        eq = 1'b0;
        lt = 1'b0;
        if(in0 > in1) gt = 1'b1;
        else if(in0 == in1) eq = 1'b1;
        else lt = 1'b1;
    end
endmodule