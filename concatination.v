module concatination (Tcount, Pcount, index_rom);
  
  input [1:0]Tcount;
  input [2:0]Pcount;
  
  output [4:0]index_rom;
  
  assign index_rom = {Tcount, Pcount};
  
endmodule