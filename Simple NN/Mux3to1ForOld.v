`timescale 1ns/1ns

module MUX4to1ForOld (a1,a2,a3,s,o); 
              
  input[13:0]
        a1;
  input[13:0]
        a2;
  input[13:0]
        a3;
  input[1:0]
         s;
  
  
  output reg [13:0]
        o;
        
        
    always@(*) begin
      
      case (s)
        
        2'b00: 
          o <= a1;
          
        2'b01:
          o <= a2;
          
        2'b10:
          o <= a3;
          
        2'b11:
          o <= 14'bx;
          
          
      endcase
   end
   
endmodule
        

