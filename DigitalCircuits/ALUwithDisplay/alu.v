// Code your design here
module ALU ( A, B, operation, result);
	input [3:0] A, B; // 4 bits
	input [2:0] operation; // 3 bits
	output [3:0] result; // 3 bits
	
	reg [3:0] result; // in order to use inside always block
	
	always @(A, B, operation)
		begin
			case (operation)
				3'b000: result = A&B; // can also write in decimal
				3'b001: result = A | B;
				3'b010:result =  ~B;
				3'b011:result = A<<B;
				3'b100:result = A+B;
				3'b101:result = A-B;
				3'b110:result = A*B;
				3'b111:result = A ^ B; // A xor B
				
				endcase
		end
endmodule

// hex to 7-segment decoder; a-g active low
module bin7seg (x, seg, an, dp);
  input [3:0] x ; //4-bit input to display
  output [0:6] seg; // segments from a to g
  output [3:0] an;   //4-bit enable signal
  output dp;

  reg [0:6] seg;

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
      15: seg = 7'b0111000;
      default: seg = 7'b0000001; // 0
      endcase

endmodule

module ALUwithDisplay(A, B, operation, result, seg, an, dp );
	input [3:0] A, B;
	input [2:0] operation;
	output [3:0] result;
	output [0:6] seg; // A to F is doing [0:6]
	output [3:0] an;
	output dp;
	
	ALU U1 (A, B, operation, result);
	bin7seg  U2 (result, seg, an, dp); // input, output, output, ouput
endmodule


