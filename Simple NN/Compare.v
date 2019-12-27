`timescale 1ns/1ns
module Cmp (a , b,Cmp);
  
  input[13:0] 
              a,
              b;
  
  output reg Cmp;
  
  //assign Cmp = (a==b && c==d)?1'b1:1'b0;
  
   	always@(*) begin
   	  if(a==b)
   	    Cmp <= 1'b1;
 	    else
 	      Cmp <= 1'b0;
 	  end
 	      
   	

endmodule