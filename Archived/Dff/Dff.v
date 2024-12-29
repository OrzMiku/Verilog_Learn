module Dff (  
    input wire clk,
    input wire d,
    output reg q = 1'b0
);

always @(posedge clk) begin
    q <= d;
end

endmodule