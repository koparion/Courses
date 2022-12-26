module subtractor(A, B, Bin, D, Bo);
  input A, B, Bin;
  output D, Bo;
  assign D = A ^ B ^ Bin;
  assign Bo = ((~A) & B) | (B & Bin) | (Bin &(~A));
endmodule
  
  
