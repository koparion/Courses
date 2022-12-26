module halfadder (x, y, S, C); 
	input x, y; 
	output S, C; 
	
	assign S = x ^ y; 
	assign C= x & y; 
endmodule
  
module fulladder (x, y, Cin, S, C);
	input x, y, Cin; // by default datatype is wire
	output S, C; // wire datatype

	wire S1, D1, D2;
	
	
	halfadder HA1( x, y, S1, D1); 
	halfadder HA2( S1, Cin, S, D2);
	
	or U3( C, D1, D2);
endmodule

