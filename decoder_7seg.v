module decoder_7seg (B, C, D, led_a, led_b, led_c,
                     led_d, led_e, led_f, led_g);
                     
	input B, C, D;  // 3 bits
	output led_a, led_b, led_c, led_d, led_e, led_f, led_g;
	
	assign led_a = ~(C | B&D | ~B&~D);
	assign led_b = ~(~B | ~C&~D | C&D);
	assign led_c = ~(B | ~C | D);
	assign led_d = ~(~B&~D | C&~D | B&~C&D | ~B&C);
	assign led_e = ~(~B&~D | C&~D);
	assign led_f = ~(~C&~D | B&~C | B&~D);
	assign led_g = ~(B&~C | ~B&C | C&~D);
	
endmodule