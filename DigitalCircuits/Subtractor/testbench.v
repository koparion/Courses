module test;
	reg A,B, Bin;
	wire D, Bo;
	
	
  	subtractor uut (A, B, Bin, D, Bo);
	initial 
		begin
              
          $dumpfile("dump.vcd"); 
          $dumpvars(1, test);
          // display the inputs and outputs
          $monitor( "D = A + B + Bin = %b - %b - %b  | D=%b | %b=Bout",  A, B, Bin, D, Bo );
              
          	 A = 0;B = 0; Bin = 0;
         #10 A = 0;B = 0; Bin = 1;
         #10 A = 0;B = 1; Bin = 0;       
         #10 A = 0;B = 1; Bin = 1;
         #10 A = 1;B = 0; Bin = 0;
         #10 A = 1;B = 0; Bin = 1;
         #10 A = 1;B = 1; Bin = 0;
         #10 A = 1;B = 1; Bin = 1;


         #10 $finish;
	end
endmodule
