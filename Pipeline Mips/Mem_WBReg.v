
module Mem_WBreg(rst,
                WB_Enable,
                MemRead,
                PC,
                ALU_Result,
                DataMem,
                Dst_Mem,    
                Clk,
                WBEnable,
                MemReadOut,
                PCOut,
                ALU_ResultOut,
                DataMemOut,
                Dst_WB);
  
  input rst,Clk,WB_Enable,MemRead;
  input[9:0] PC;
  input[15:0] DataMem;
  input[15:0] ALU_Result;
  input[3:0] Dst_Mem;
  
  output reg WBEnable,MemReadOut;
  output reg [9:0] PCOut;
  output reg [15:0] DataMemOut;
  output reg [15:0] ALU_ResultOut;
  output reg [3:0] Dst_WB;
  
  always@(posedge Clk, posedge rst) begin
      if(rst) begin
        WBEnable <= 0;
        MemReadOut <= 0;
        PCOut <= 0;
        DataMemOut <= 0;
        ALU_ResultOut <= 0;
        Dst_WB <= 0;
      end
      else begin
        WBEnable<=WB_Enable;
        MemReadOut<=MemRead;
        DataMemOut<=DataMem;
        PCOut<=PC;
        ALU_ResultOut<=ALU_Result;
        Dst_WB <= Dst_Mem;
      end
  end

endmodule

