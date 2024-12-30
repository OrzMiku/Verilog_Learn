module edge_test (
    input clk,
    input rst_n,
    input a,
    output a_posedge,
    output a_negedge,
    output a_edge
);

    reg a_delay;

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) a_delay <= 1'b0;
        else a_delay <= a;
    end

    assign a_posedge = a & ~a_delay;
    assign a_negedge = ~a & a_delay;
    assign a_edge = a ^ a_delay;

endmodule