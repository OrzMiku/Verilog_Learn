module sseg4_display (
    input clk,
    input rst_n,
    input [3:0] in0,
    input [3:0] in1,
    input [3:0] in2,
    input [3:0] in3,
    output reg dp0,
    output reg dp1,
    output reg dp2,
    output reg dp3,
    output reg [3:0] an,
    output reg [6:0] sseg
);

// 0-15 for counter, 16-17 for select
reg [17:0] cnt; // counter
reg [3:0] hex_in; // input hex
reg dp; // decimal point

// Counter
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) cnt <= 18'b0;
    else cnt <= cnt + 18'b1;
end

// Select
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        hex_in <= 4'b0000;
        dp <= 1'b0;
        an <= 4'b1111;
    end
    else begin
        case(cnt[17:16])
            2'b00: begin
                hex_in <= in0;
                dp <= dp0;
                an <= 4'b1110;
            end
            2'b01: begin
                hex_in <= in1;
                dp <= dp1;
                an <= 4'b1101;
            end
            2'b10: begin
                hex_in <= in2;
                dp <= dp2;
                an <= 4'b1011;
            end
            2'b11: begin
                hex_in <= in3;
                dp <= dp3;
                an <= 4'b0111;
            end
            default: begin
                hex_in <= 4'b0000;
                dp <= 1'b0;
                an <= 4'b1111;
            end
        endcase
    end
end

// 7-segment display
always @* begin
    case(hex_in)
        4'b0000: sseg = 7'b100_0000; // 0
        4'b0001: sseg = 7'b111_1001; // 1
        4'b0010: sseg = 7'b010_0100; // 2
        4'b0011: sseg = 7'b011_0000; // 3
        4'b0100: sseg = 7'b001_1001; // 4
        4'b0101: sseg = 7'b001_0010; // 5
        4'b0110: sseg = 7'b000_0010; // 6
        4'b0111: sseg = 7'b111_1000; // 7
        4'b1000: sseg = 7'b000_0000; // 8
        4'b1001: sseg = 7'b001_0000; // 9
        4'b1010: sseg = 7'b000_1000; // A
        4'b1011: sseg = 7'b000_0011; // B
        4'b1100: sseg = 7'b100_0110; // C
        4'b1101: sseg = 7'b010_0001; // D
        4'b1110: sseg = 7'b000_0110; // E
        4'b1111: sseg = 7'b000_1110; // F
        default: sseg = 7'b111_1111; // off
    endcase
end

endmodule