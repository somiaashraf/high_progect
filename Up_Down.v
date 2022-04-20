module Up_Down(Up, Down, clk);
  
  input Up, Down;
  output clk;
  
  assign clk = ~Up | ~Down;
  
endmodule
