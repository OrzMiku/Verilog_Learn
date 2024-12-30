// CLK: 100Mhz
module fsm_debounce (
    input clk,
    input rst_n,
    input btn_in,
    output reg btn_out
);

localparam N = 20; // 2^N > 1_000_000, 2^(N-1) < 1_000_000

// State definition
localparam [2:0] zero = 3'b000; // Stable 0
localparam [2:0] zero1 = 3'b001; // Detected 1
localparam [2:0] zero2 = 3'b010; // Detected 1 & tick1
localparam [2:0] zero3 = 3'b011; // Detected 1 & tick2
localparam [2:0] one = 3'b100; // Stable 1
localparam [2:0] one1 = 3'b101; // Detected 0
localparam [2:0] one2 = 3'b110; // Detected 0 & tick1
localparam [2:0] one3 = 3'b111; // Detected 0 & tick2

reg [2:0] current_state, next_state;
reg [N:0] cnt;
wire tick;

// Counter
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) cnt <= 0;
    else if(cnt == CNT_MAX-1) cnt <= 0;
    else cnt <= cnt + 1;
end

// Tick
assign tick = (cnt == 0) ? 1 : 0;

// Current state
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) current_state <= zero;
    else current_state <= next_state;
end

// Next state
always @* begin
    next_state = current_state;
    case(current_state)
        zero: 
            if(btn_in) next_state = zero1;
        zero1:
            if(!btn_in) next_state = zero;
            else if(tick) next_state = zero2;
        zero2:
            if(!btn_in) next_state = zero;
            else if(tick) next_state = zero3;
        zero3:
            if(!btn_in) next_state = zero;
            else if(tick) next_state = one;
        one:
            if(!btn_in) next_state = one1;
        one1:
            if(btn_in) next_state = one;
            else if(tick) next_state = one2;
        one2:
            if(btn_in) next_state = one;
            else if(tick) next_state = one3;
        one3:
            if(btn_in) next_state = one;
            else if(tick) next_state = zero;
    endcase
end

// Output
always @* begin
    btn_out = 1'b0;
    case(current_state)
        one, one1, one2: btn_out = 1'b1;
        one3:
            if({btn_in, tick} != 2'b01) btn_out = 1'b1;
        zero3:
            if(btn_in & tick) btn_out = 1'b1;
    endcase
end
    
endmodule