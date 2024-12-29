// D触发器，带异步复位，rst信号下降沿有效
module Dff_rst (  
    input wire clk,
    input wire rst,
    input wire d,
    output reg q = 1'b0
);

always @(posedge clk or negedge rst) begin
    if (~rst) begin
        q <= 1'b0;
    end
    else begin
        q <= d;
    end
end

endmodule