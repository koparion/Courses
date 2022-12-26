// Code your design here
module halfadder(S, C, x, y);
  input x, y;
  output S, C;

  xor U1(S, x, y);
  and U2(C, x, y);
endmodule
  
  
module fulladder (S, C, x, y, cin);
  input x,y,cin;
  output S, C;
  wire S1, D1, D2;

  halfadder HA1 (S1, D1, x, y); 
  halfadder HA2 (S, D2, S1, cin);
  or U3(C, D1, D2);
 
endmodule

module four_bit_adder(S, C4, A, B, Cin);
  input [3:0] A;
  input [3:0] B;//4 bits 0 to 3- the order matters
  input Cin;
  output [3:0] S; // sum 4 bits
  output C4; // one bit
  wire C1, C2, C3; // carryout wires
  fulladder FA1 (S[0], C1, A[0], B[0], Cin); // first full adder
  fulladder FA2 (S[1], C2, A[1], B[1], C1);
  fulladder FA3 (S[2], C3, A[2], B[2], C2);
  fulladder FA4 (S[3], C4, A[3], B[3], C3);
endmodule

module adder_subtractor(S, C, A, B, M);
	input [3:0] A,B;
	input M; //addition or subtraction
	output [3:0] S; // sum
	output C;
	
	// must give a name to wires coming out of U1 to U4
	wire [3:0] D; // 4 wires that range from D0 to D3
	
	xor U1(D[0], B[0], M);
	xor U2(D[1], B[1], M);
	xor U3(D[2], B[2], M);
	xor U4(D[3], B[3], M);
	
	// D is the input for the B as it’s the wire that’s connected to adder
  four_bit_adder U5(S, C, A, D , M); 
endmodule

module ALU(A, B, operation, result);

//inputs and outputs
	input [1:0] operation;
    input [3:0] A, B;
  	output [3:0] result;
  	wire M, C;
  	wire [3:0] S,andGate, orGate;
  

// Instantiate AND gates and OR gates
  	and a1(andGate[0], A[0], B[0]);
  	and a2(andGate[1], A[1], B[1]);
  	and a3(andGate[2], A[2], B[2]);
  	and a4(andGate[3], A[3], B[3]);
  	or o1(orGate[0], A[0], B[0]);
  	or o2(orGate[1], A[1], B[1]);
  	or o3(orGate[2], A[2], B[2]);
  	or o4(orGate[3], A[3], B[3]);
 // Assign operation[0] to M
  	assign M = operation[0];
  
// Instantiate add_subtractor
  	adder_subtractor as(S, C, A, B, M);
   
// Instantiate mux4x1 
  	mux4x1 mux(S, S, andGate, orGate, operation, result);
  
endmodule

module mux4x1(i0, i1, i2, i3, select, y);
   input [3:0] i0,i1,i2,i3;
   input [1:0] select;
   output [3:0] y;
   reg [3:0] y; 
   always @ (i0 or i1 or i2 or i3 or select) 
            case (select)
               2'b00: y = i0;
               2'b01: y = i1;
               2'b10: y = i2;
               2'b11: y = i3;
            endcase
endmodule
