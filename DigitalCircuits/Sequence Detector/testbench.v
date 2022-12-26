// Code your testbench here
// or browse Examples
module test;
    reg mclk,  reset, x;  
	// Inputs
              wire clk, y;  
	// Outputs
    wire [1:0] state;  // Outputs
            sequence_detector uut( mclk, clk, reset, x, y, state);  // Instantiate the Unit Under Test (UUT)
 
	     initial                           // generate clock signal
	       begin
	        mclk = 0;
	        forever  #5 mclk = ~mclk; 
	        #200 $finish;  
	     end
       
          initial
            begin
              $dumpfile("dump.vcd"); $dumpvars(1, test);
              $monitor( "state = %b, x = %b, y= %b ", state, x, y );  

              // Initialize Inputs
                    x = 0;    reset = 1;
              #13             reset = 0;
              #10   x = 0;
              #10   x = 0;
              #10   x = 1; 
              #10   x = 0; 
              #10   x = 1; 
              #10   x = 1;  
              #10   x = 0;  
              #10   x = 1;  
              #10   x = 0;  
              #10   x = 0;  
              #10   x = 1;  
              #10   x = 0;  
              #10   x = 1;  
              #10 $finish;
            end
endmodule
