module Stack_tb  ; 
 
  wire  [15:0]  Dout   ; 
  reg    push   ; 
  reg    rst   ; 
  reg    tos   ; 
  reg    clk   ; 
  reg  [15:0]  Din   ; 
  reg    pop   ; 
  
 
  initial begin clk = 1'b0;
  forever #50  clk = !clk;
  end
  
  Stack  
   DUT  ( 
       .Dout (Dout ) ,
      .push (push ) ,
      .rst (rst ) ,
      .tos (tos ) ,
      .clk (clk ) ,
      .Din (Din ) ,
      .pop (pop ) ); 
initial begin
rst =1;
#100;
rst=0;
Din = 16'b1;
#100
push=1;
#100
push=0;
  #100
push=1;
#100
push=0;
#100
push=1;
#100
push=0;
#100
push=1;
#100
push=0;

#1000
$stop;
  
end

endmodule

