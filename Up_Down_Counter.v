module Up_Down_Counter(clk, reset, up, down, count, leds);
  
  input clk, reset, up, down;
  
  
  output [2:0] count;  // 3 bits output
  output leds;
  
  
  reg [2:0] count;    // 3 bits reg to hold the value of the output
  reg leds;
  
  // BDC counter
  
  always @(posedge clk or posedge reset)
  begin
    if(reset) // reset the counter circuit to intial (zero)
      begin
        count <= 0;
        leds = 0;
      end
     else
       begin
         if(~up)
           begin
             if(count == 7)
               leds = 1;        // full
             else
               begin
                 count <= count + 1'b1;  // increment
                 leds = 0;
               end
           end
         else if(~down)
           begin
             if(count == 0)
               leds = 1;       // empty
             else
               begin
                 count <= count - 1'b1;     // decrement
                 leds = 0;
               end
           end
       end
  end
     
endmodule


