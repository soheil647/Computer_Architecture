
module EX_Memreg(rst,
                WB_Enable,
                MemWrite,
                MemRead,
                PC,
                ALU_Result,
                ST_Value,
                DstReg,     
                Clk,
                WBEnable,
                MemReadOut,
                MemWriteOut,
                PCOut,
                ALU_ResultOut,
                ST_ValueOut,
                DstRegOut);
  
  input rst,Clk,WB_Enable,MemWrite,MemRead;
  input[9:0] PC;
  input[3:0] DstReg;
  input[15:0] ST_Value;
  input[15:0] ALU_Result;
  
  output reg WBEnable;
  output reg MemReadOut;
  output reg MemWriteOut;
  output reg [9:0] PCOut;
  output reg [3:0] DstRegOut;
  output reg [15:0] ST_ValueOut;
  output reg [15:0] ALU_ResultOut;
  
  always@(posedge Clk, posedge rst) begin
      if(rst) begin
        WBEnable <= 0 ;
        MemReadOut <= 0 ;
        MemWriteOut <= 0 ;
        PCOut <= 0 ;
        DstRegOut <= 0 ;
        ST_ValueOut <= 0 ;
        ALU_ResultOut <= 0 ;
      end
      else begin 
        WBEnable<=WB_Enable;
        MemWriteOut<=MemWrite;
        MemReadOut<=MemRead;
        ST_ValueOut<=ST_Value;
        PCOut<=PC;
        ALU_ResultOut<=ALU_Result;
        DstRegOut<=DstReg;
      end 
  end

endmodule
