// Code your testbench here
// or browse Examples
module test;
  reg [1:0] A,B;
  wire [3:0] C;
	
	
  multiplier uut (A, B, C);
	initial 
		begin
              
          $dumpfile("dump.vcd"); 
          $dumpvars(1, test);
          // display the inputs and outputs
          $monitor( "A * B = %b * %b", A, B, "| C= %b", C);
          
              
//              A = 2'b00;B = 2'b00;
//          #10 A = 2'b00;B = 2'b01;
//          #10 A = 2'b01;B = 2'b00;
//          #10 A = 2'b10;B = 2'b10;
//          #10 A = 2'b11;B = 2'b11;
			    A = 0;B = 0;
            #10 A = 0;B = 1;
            #10 A = 1;B = 0;
            #10 A = 1;B = 1;
            #10 A = 2;B = 2;
          	#10 A = 3;B = 3;
          
    
         #10 $finish;
	end
endmodule
