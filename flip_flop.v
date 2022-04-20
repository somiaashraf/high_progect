
module flip_flop(clk, reset, D, Q);
  input clk, reset, D;
  output Q;
  reg Q;
  
  
  always @(posedge clk or posedge reset)
  begin
    if(reset)
      Q <= 1'b0;
    else
      Q <= D;
    end
  endmodule