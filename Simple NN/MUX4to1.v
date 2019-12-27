`timescale 1ns/1ns
module MUX4to1ForX (a1 ,a2,s,o); 
              
  input[6:0]
        a1;
  input[6:0]
        a2;
  input[1:0]
         s;
  
  
  output reg [6:0]
        o;
        
        
    always@(*) begin
      
      case (s)
        
        2'b00: 
          o <= a1;
          
        2'b01:
          o <= a2;
          
        2'b10:
          o <= 1;
          
        2'b11:
          o <= 14'bx;
          
          
      endcase
   end
   
endmodule
        
