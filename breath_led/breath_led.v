module breath_led (
    input clk,
    input rst_n,
    output reg led
);

localparam  CLK_FREQ      = 100_000_000,          // 100Mhz
            TIME_1US      = 0.000_001,            // 1us
            TIME_1MS      = 0.001,                // 1ms
            TIME_1S       = 1,                    // 1s
            CNT_MAX_1US   = CLK_FREQ * TIME_1US,  // 100
            CNT_MAX_1MS   = TIME_1MS / TIME_1US,  // 1000
            CNT_MAX_1S    = TIME_1S / TIME_1MS;   // 1000
            
reg [31:0] cnt_1us, cnt_1ms, cnt_1s;
reg inc_dec_flag; // 0: increment, 1: decrement

// Counter 1us
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) cnt_1us <= 0;
    else if(cnt_1us == CNT_MAX_1US-1) cnt_1us <= 0;
    else cnt_1us <= cnt_1us + 1;
end

// Counter 1ms
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) cnt_1ms <= 0;
    else if(cnt_1ms == CNT_MAX_1MS-1) cnt_1ms <= 0;
    else if(cnt_1us == CNT_MAX_1US-1) cnt_1ms <= cnt_1ms + 1;
    else cnt_1ms <= cnt_1ms;
end

// Counter 1s
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) cnt_1s <= 0;
    else if(cnt_1s == CNT_MAX_1S-1) cnt_1s <= 0;
    else if(cnt_1ms == CNT_MAX_1MS-1 && cnt_1us == CNT_MAX_1US-1) cnt_1s <= cnt_1s + 1;
    else cnt_1s <= cnt_1s;
end

// Increment/Decrement flag flip
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) inc_dec_flag <= 0;
    else if(cnt_1s == CNT_MAX_1S-1 && cnt_1ms == CNT_MAX_1MS-1 && cnt_1us == CNT_MAX_1US-1) inc_dec_flag <= ~inc_dec_flag;
    else inc_dec_flag <= inc_dec_flag;
end

// LED
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) led <= 0;
    else if(inc_dec_flag && cnt_1ms >= cnt_1s || !inc_dec_flag && cnt_1ms <= cnt_1s) led <= 1'b1;
    else led <= 1'b0;
end

endmodule