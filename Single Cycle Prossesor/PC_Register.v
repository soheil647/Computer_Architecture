
module PC_Reg(PC_Next,
              Clk,
              Rst,
              PC);
              
  input [9:0] PC_Next;
  input Clk,Rst;
  output reg [9:0] PC;           

    always@(posedge Clk , posedge Rst  ) begin
      if(Rst)
        PC <= 10'b0;
      else
        PC <= PC_Next;
        
    end
    
  endmodule
        