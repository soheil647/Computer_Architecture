
module PC_Reg(PC_Next,
              PC_Write,
              Clk,
              Rst,
              PC);
              
  input [9:0] PC_Next;
  input Clk,Rst;
  input PC_Write;
  output reg [9:0] PC;           

    always@(posedge Clk) begin
      if(Rst)
        PC <= 10'b0;
      else if(PC_Write)
        PC <= PC_Next;
      else
        PC <= PC;
        
    end
    
  endmodule
        