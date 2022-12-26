// Code your design here
module sequence_detector( mclk, clk, reset, x, y, state);
     input mclk, reset, x;
     output clk, y;
     output reg [1:0] state;
 
     assign clk = mclk;      // for simulation only, skip clock divider, comment the line when using basys2
     //clkDiv clockdivider(mclk, clk);   // existing module - need to use clock divider for Basys2 Board
 
   always @( posedge clk, posedge reset )
       if( reset )
	         state = 2'b00;
	   else
	       case ( state )
	          2'b00:
	            if( x ) state = 2'b01; else state = 2'b00;
	              
	          2'b01:
				if( x ) state = 2'b01; else state = 2'b10;
                 
	          2'b10:
				if( x ) state = 2'b11; else state = 2'b00;
        
	          2'b11:
				if ( x) state = 2'b01; else state = 2'b10;
                 
        	endcase
 
   	assign  y = state[1] & state[0];          // output y at state “11”
 
endmodule

