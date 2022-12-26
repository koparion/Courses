module halfadder (x, y, S, C); 
	input x, y; 
	output S, C; 
	
	assign S = x ^ y; 
	assign C= x & y; 
endmodule

module multiplier(A, B, C);
  input[1:0] A, B;
  output[3:0] C;
  
  wire U1, U2, U3, U4,C2,C3, n1,n2,n3,n4;
  
  and n1(C[0], A[0], B[0]);
  and n2(U1, A[0], B[1]);
  and n3(U2, A[1], B[0]);
  halfadder HA1 (n2, n3 , U3, n2);
  and n4(U4, A[1], B[1]);
  halfadder HA2 (C[2], C[3], C3, C2); 

endmodule

// module multiplier(A, B, C);
//     input [1:0] A, B;
//   	output reg [3:0] C;

// always @* begin
//     C = A * B;
// end
