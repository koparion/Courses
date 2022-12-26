// Code your testbench here
// or browse Examples
module test;
  reg [3:0] A, B;
  wire u, v, w;
  wire [0:6] seg;       // Outputs
  wire [3:0] an;
  wire dp;
  
  magComparator UUT(A, B, u, v, w, seg, an, dp);
  
  initial
    begin
      $dumpfile("dump.vcd");$dumpvars(1,test);
      
      $monitor("A = %d | B = %d | u(A=B) = %b | v(A>B) = %b | w(A<B) = %b", A, B, u, v, w);
//       $monitor("A = %b | B = %b | result = %b", A, B, seg);
      
      A = 1; B = 2; #5
      A = 3; B = 3; #5
      A = 8; B = 5; #5
      A = 4; B = 10; #5
      A = 2; B = 7; #5
      A = 7; B = 7; #5
      A = 5; B = 3; #5
      A = 9; B = 8; #5
      A = 2; B = 2; #5
    
      #10 $finish;
    end
endmodule
  
