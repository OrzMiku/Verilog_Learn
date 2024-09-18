// 2选1多路复用器
module mux2to1 (
    input  wire a,
    input  wire b,
    input  wire s,
    output wire y
);
  assign y = (s ? a : b);
endmodule

// 2选1多路复用器测试
module mux2to1_tb;
  reg a, b, s;
  wire y;

  // 实例化
  mux2to1 mux2to1_inst (
      .a(a),
      .b(b),
      .s(s),
      .y(y)
  );

  // 仿真
  initial begin
    $monitor("a=%b, b=%b, s=%b, y=%b\n", a, b, s, y);
    // 测试用例 1
    $display("Case 1");
    a = 1'b1;
    b = 1'b0;
    s = 1'b0;
    #10;
    // 测试用例 2
    $display("Case 2");
    a = 1'b1;
    b = 1'b0;
    s = 1'b1;
    #10;
    // 测试用例 3
    $display("Case 3");
    a = 1'b0;
    b = 1'b1;
    s = 1'b0;
    #10;
    // 测试用例 4
    $display("Case 4");
    a = 1'b0;
    b = 1'b1;
    s = 1'b1;
    // 结束仿真
    #10 $finish;
  end

endmodule
