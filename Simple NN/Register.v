`timescale 1ns/1ns
module Reg7 (a
            ,o
            ,Rst
            ,Clk
            ,enable);
  input[6:0]
           a;
  input 
          Rst;
  input   
          enable;
  input 
          Clk;
  output reg[6:0] 
          o;
  
  always@(posedge Clk)
  begin
    if(Rst)
        o <= 7'b0;
      
      
    else if(enable)     
        o <= a;
      
    end
    
  endmodule