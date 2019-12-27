`timescale 1ns/1ns
module Reg2 (a
            ,o
            ,Rst
            ,Clk
            ,enable);
  input[1:0]
           a;
  input 
          Rst;
  input   
          enable;
  input 
          Clk;
  output reg[1:0] 
          o;
  
  always@(posedge Clk)
  begin
    if(Rst)
        o <= 2'b0;
      
      
    else if(enable)     
        o <= a;
      
    end
    
  endmodule
