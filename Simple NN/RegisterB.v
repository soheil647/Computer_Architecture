
`timescale 1ns/1ns
module Reg14B( a
              ,o
              ,Rst
              ,Clk
              ,enable);
  input[13:0]
           a;
  input 
          Rst;
  input   
          enable;
  input 
          Clk;
  output reg[13:0] 
          o;
  
  always@(posedge Clk)
  begin
    if(Rst)
        o <= 1;
      
      
    else if(enable)     
        o <= a;
      
    end
    
  endmodule

