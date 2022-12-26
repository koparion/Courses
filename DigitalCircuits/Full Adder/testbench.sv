// Code your testbench here
// or browse Examples
module test;
	reg x, y, Cin;    // Inputs
	wire S, C;       // Outputs

	// Instantiate the Unit Under Test (UUT)
	fulladder uut (x, y, Cin, S, C); 

	initial 
           begin
		
             $dumpfile("dump.vcd"); 
             $dumpvars(1, test);
             // display the inputs and outputs
             $monitor( "x + y + Cin = %b + %b + %b = C S = %b %b",  x, y, Cin, C, S );

		// Initialize Inputs
  		    x = 0;y = 0; Cin = 0;
            #10 x = 0;y = 0; Cin = 1;
            #10 x = 0;y = 1; Cin = 0;       
          	#10 x = 0;y = 1; Cin = 1;
            #10 x = 1;y = 0; Cin = 0;
            #10 x = 1;y = 0; Cin = 1;
            #10 x = 1;y = 1; Cin = 0;
            #10 x = 1;y = 1; Cin = 1;
             	
            #10 $finish;
                  
	    end
  
           
   
endmodule

