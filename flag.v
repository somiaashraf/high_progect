module flag (B, C, D, led_a, led_b, led_c, led_d, led_e, led_f, led_g);
  
   input B, C, D;   // 3 bits
	output led_a, led_b, led_c, led_d, led_e, led_f, led_g;
	
	// full -> F
	// empty -> E
	
	assign led_a = ~(B&C&D | ~B&~C&~D);
	assign led_b = 1;
	assign led_c = 1;
	assign led_d = ~(~B&~C&~D);
	assign led_e = ~(B&C&D | ~B&~C&~D);
	assign led_f = ~(B&C&D | ~B&~C&~D);
	assign led_g = ~(B&C&D | ~B&~C&~D);
	
endmodule