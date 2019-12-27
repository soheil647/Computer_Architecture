module CPU_TEST();
  reg Clk;
  reg Rst;
  CPU_top CPU1(
  Clk,
  Rst,
  );

  
  always #100 Clk=~Clk;
  
  initial begin
    
  Clk=0;
  Rst=1;
  #250
  Rst=0;
  #9000
  $stop;  
    
  end
  
  
endmodule
