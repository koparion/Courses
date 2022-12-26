// Code your testbench here
// or browse Examples
module test;
	reg [3:0] A,B;
	reg M;
	
	wire [3:0] S;
	wire C;
	
	adder_subtractor uut(S, C, A, B, M);
		initial
			begin
			$dumpfile("dump.vcd");  $dumpvars(1, test);  
	             
                   // display the inputs and outputs
              $monitor( "%d %d Sum = %d Carry = %d", A, B, S , C);

			// A: 0 to 15
			// B: 0 to 15
			// testting only few cases
			
			// addition
			
			 A=3; B = 2; M = 0;
			#10 A=8; B = 5; M= 0;
			
			//subtraction
			#10 
			#10 A=2; B = 2; M=1;
			#10 A=4; B= 3; M=1;
			
			#10 $finish;
		end
endmodule
