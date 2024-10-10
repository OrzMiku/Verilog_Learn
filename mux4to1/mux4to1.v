module mux4to1 (
    in0,
    in1,
    in2,
    in3,
    s1,
    s0,
    out
);
  input in0, in1, in2, in3, s1, s0;
  output reg out;

  always @* begin
    case ({
      s1, s0
    })
      2'b00:   out = in0;
      2'b01:   out = in1;
      2'b10:   out = in2;
      default: out = in3;
    endcase
  end
endmodule
