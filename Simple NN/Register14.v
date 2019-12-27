`timescale 1ns/1ns
module Reg14 ( a
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
        o <= 14'b0;
      
      
    else if(enable)     
        o <= a;
      
    end
    
  endmodule
