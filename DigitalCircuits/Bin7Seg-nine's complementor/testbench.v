// Code your testbench here
// or browse Examples
module test;
    reg  [3:0] x;    // Inputs
    wire [0:6] seg;       // Outputs
 	wire [3:0] an;
	wire dp;
        // Instantiate the Unit Under Test (UUT)
  	nine_s_complementer uut( x, seg, an, dp);
 
    initial 
           begin
		$dumpfile("dump.vcd");  $dumpvars(1, test);  
                 
                   // display the inputs and outputs
    
		 $monitor( " %b  %b", x, seg );
 
           // Initialize Inputs
	            x = 0; 
	      	#10 x = 1; 
			#10 x = 2;
			#10 x = 3;
			#10 x = 4;
			#10 x = 5;
			#10 x = 6;
			#10 x = 7;
			#10 x = 8;
			#10 x = 9;
	         
            #10 $finish;
           end
endmodule 
