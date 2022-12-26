// Code your testbench here
// or browse Examples
module test;
  reg [3:0] A;
  wire [3:0] B;
  
  BCD2Excess3 UUT(.A(A), .B(B));
  	initial
      begin
        $monitor("A = %b | B = %b", A, B);
        $dumpfile("dump.vcd");  $dumpvars(1, test); 
        A = 0; #10
        A = 1; #10
        A = 2; #10
        A = 3; #10
        A = 4; #10
        A = 5; #10
        A = 6; #10
        A = 7; #10
        A = 8; #10
        A = 9; #10
        #10 $finish;
      end
endmodule
        
        
