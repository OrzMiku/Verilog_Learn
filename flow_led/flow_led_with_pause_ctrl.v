module flow_led_with_pause_ctrl (
    input clk,
    input rst_n,
    input ctrl,
    output reg [15:0] led
);

parameter CLK_FREQ = 1_0000_0000; // 100 MHz
parameter CNT_TIME = 0.5; // 0.5 second
parameter CNT_MAX = CLK_FREQ * CNT_TIME; // 5 * 10^7

reg [31:0] cnt; // counter
reg cnt_ctrl; // control signal
wire cnt_ctrl_negedge; // negative edge of control signal

// Edge detector
edge_test u_edge_test(
    .clk(clk),
    .rst_n(rst_n),
    .a(ctrl),
    .a_posedge(cnt_ctrl),
    .a_negedge(cnt_ctrl_negedge),
);

// Counter control
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) cnt_ctrl <= 1'b1;
    else if(cnt_ctrl_negedge) cnt_ctrl <= ~cnt_ctrl;
    else cnt_ctrl <= cnt_ctrl;
end

// Timer
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) cnt <= 32'b0;
    else if(cnt_ctrl) cnt <= cnt;
    else if(cnt == CNT_MAX - 1) cnt <= 32'b0;
    else cnt <= cnt + 32'b1;
end

// LED
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) led <= 16'b0000_0000_0000_0001;
    else if(cnt == CNT_MAX - 32'b1) led <= {led[14:0], led[15]};
    else led <= led;
end
    
endmodule