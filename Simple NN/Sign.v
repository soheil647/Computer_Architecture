`timescale 1ns/1ns
module Sign (a , o);
  
  input[13:0] 
            a;
  
  output[1:0] 
            o;        
	
	assign o = a[13]?2'b11:!a[13]?2'b01:2'bzz;
//	always begin
//		if (a[13] == 1)
//		 o = 2'b11;
//		 
//		else
//	  o = 2'b01;
//	  
//	end
	
endmodule