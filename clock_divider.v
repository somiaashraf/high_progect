module clock_divider (clk, reset, CLK0_01Hz);
  input clk, reset;
  output CLK0_01Hz;
  // ---------------------------------------------- //
  reg CLK0_01Hz;
  reg [17:0] count; // log2(25e4)
  // ---------------------------------------------- // 
  always @(posedge clk or posedge reset)
     begin
      if(reset) // intial (zero)
          begin
              count <= 0;
              CLK0_01Hz <= 0;
           end
       else
          begin
              if(count < 250_000)
                      count <= count + 1;    // count 25e4
              else
                 begin
                    CLK0_01Hz <= ~CLK0_01Hz;   // toggle the clk high\low
                     count <=0;
                end   
           end
     end
  endmodule
