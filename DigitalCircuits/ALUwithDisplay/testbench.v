// Code your testbench here
// or browse Examples
module test;
	//input must be declared as reg
	//output must be declared as output
	
	reg [3:0] A, B; //input
	reg [2:0] operation; //input
	wire [3:0] result; //output
	
	ALU uut (A, B, operation, result);
	
	initial
		begin
		$dumpfile("dump.vcd");  $dumpvars(1, test);       
		                 // display the inputs and outputs
		    
				 $monitor( " %d %d  %d", A, B, result );
		
		//need a forloop to check 0 to 15 cases
			//for lab setting A and B for simplicity
			operation = 0; A = 3; B = 2;
			#10 operation = 1;
			#10 operation = 2;
			#10 operation = 3;
			#10 operation = 4;
			#10 operation = 5;
			#10 operation = 6;
			#10 operation = 7;
			
		end
endmodule
			
