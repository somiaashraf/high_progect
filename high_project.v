module high_project (clk, reset, push_up, push_down, Tcount, segment_Pcount, segment_flag, leds, rom_leds1, rom_leds2, Tcount_7seg);
  
  input clk , reset, push_up, push_down;
  input [1:0]Tcount;
  
  output [6:0]segment_Pcount, segment_flag, rom_leds1, rom_leds2, Tcount_7seg;
  output [9:0]leds;
  
  wire clk0_01Hz, Q_up, Q_down, UP, Y;
  wire [2:0] count_wire;
  wire [4:0]index_rom, Wtime;
  
  clock_divider clock_div(clk, reset, clk0_01Hz);

  flip_flop ff1(clk0_01Hz, reset, push_up, Q_up);
  
  flip_flop ff2(clk0_01Hz, reset, push_down, Q_down);
  
  Up_Down Up_Down(Q_up, Q_down, UP);
  
  Up_Down_Counter Counter(UP, reset, push_up, push_down ,count_wire, Y);
  
  decoder_7seg decoder_7seg(count_wire[2], count_wire[1], count_wire[0], segment_Pcount[6], segment_Pcount[5], segment_Pcount[4], segment_Pcount[3]
                            ,segment_Pcount[2], segment_Pcount[1], segment_Pcount[0]);
                            
  flag flag(count_wire[2], count_wire[1], count_wire[0], segment_flag[6], segment_flag[5], segment_flag[4], segment_flag[3]
            ,segment_flag[2], segment_flag[1], segment_flag[0]);
            
  leds_alarm led (Y, leds[9], leds[8], leds[7], leds[6], leds[5], leds[4], leds[3], leds[2], leds[1], leds[0]);
  
									 
  concatination con(Tcount, count_wire, index_rom);
  
  rom rom(index_rom, Wtime);
  
  wire [3:0] digit1 = Wtime % 10;
  wire [3:0] digit2 = Wtime / 10;
  
  sevenSegments d1(digit1[3], digit1[2], digit1[1], digit1[0],
              rom_leds1[6], rom_leds1[5], rom_leds1[4], rom_leds1[3], rom_leds1[2], rom_leds1[1], rom_leds1[0]);
				
  sevenSegments d2(digit2[3], digit2[2], digit2[1], digit2[0],
              rom_leds2[6], rom_leds2[5], rom_leds2[4], rom_leds2[3], rom_leds2[2], rom_leds2[1], rom_leds2[0]);
              
  sevenSegments display_Tcount(0, 0, Tcount[1], Tcount[0],
                 Tcount_7seg[6], Tcount_7seg[5], Tcount_7seg[4], Tcount_7seg[3], Tcount_7seg[2], Tcount_7seg[1], Tcount_7seg[0]);
                 
                 
endmodule