// Code your design here
module halfadder (S,C,x,y);
   input x,y;
   output S,C;
//Instantiate primitive gates
   xor (S,x,y);
   and (C,x,y);
endmodule

module fulladder (S,C,x,y,cin);
   input x,y,cin;
   output S,C;
   wire S1,D1,D2; //Outputs of first XOR and two AND gates 
//Instantiate the halfadder 
    halfadder HA1 (S1,D1,x,y); 
    halfadder HA2 (S,D2,S1,cin);
    or g1(C,D2,D1);
endmodule

module four_bit_adder (S, C4, A, B, C0);
   input [3:0] A,B;
   input C0;
   output [3:0] S; 
   output C4;
   wire C1,C2, C3;  //Intermediate carries
//Instantiate the fulladder 
   fulladder  FA0 (S[0],C1,A[0],B[0],C0);
   fulladder  FA1 (S[1],C2,A[1],B[1],C1);
   fulladder  FA2 (S[2],C3,A[2],B[2],C2); 
   fulladder  FA3 (S[3],C4,A[3],B[3],C3); 
        
endmodule


module Add_Sub_4_bit(A, B, M, S, C4);
   input [3:0] A,B;
   input M;  
   output [3:0] S;  
   output C4;
	
   wire [3:0] E;  //Output of XOR gates
	
	xor U0(E[0], B[0], M);
	xor U1(E[1], B[1], M);
	xor U2(E[2], B[2], M);
	xor U3(E[3], B[3], M);
	output u, v, w;

  	four_bit_adder U4(S, C4, A, E, M);

endmodule

module bin7seg (x, seg, an, dp);
input [3:0] x ; //4-bit input to display
output [6:0] seg; // segments from a to g
output [3:0] an;   //4-bit enable signal
output dp;

reg [6:0] seg;

assign an = 4'b1110;
assign dp = 1;

always @(*)

case(x)
0: seg = 7'b0000001;
1: seg = 7'b1001111;
2: seg = 7'b0010010;
3: seg = 7'b0000110;
4: seg = 7'b1001100;
5: seg = 7'b0100100;
6: seg = 7'b0100000;
7: seg = 7'b0001111;
8: seg = 7'b0000000;
9: seg = 7'b0000100;
'hA: seg = 7'b0001000;
'hb: seg = 7'b1100000;
'hC: seg = 7'b0110001;
'hd: seg = 7'b1000010;
'hE: seg = 7'b0110000;
'hF: seg = 7'b0111000;
default: seg = 7'b0000001; // 0
endcase

endmodule

module magComparator(A, B, u, v, w, seg, an, dp);
  input [3:0] A, B;
  output u,v,w;
  output [0:6] seg;
  output [3:0] an;
  output dp;
  
  output[3:0] S;
  output C4;
//   wire[3:0] sumDif;
  
  Add_Sub_4_bit U1(A, B, 1, S, C4);
  
  bin7seg U2(S, seg, an, dp); // display
  
  assign u = ~(S[0]|S[1]|S[2]| S[3]);
  assign v = ((S[0]|S[1]|S[2]| S[3]) & C4);
  assign w = ~(C4);
 
  
endmodule
