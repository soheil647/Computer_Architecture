

module ID_EXreg(rst,
                WB_Enable,
                MemWrite,
                MemRead,
                ALUOperation,
                Br_Taken,
                PC,
                Reg1,
                Reg2,
                RegOrExtend,
                SrcReg1,
                SrcReg2Or0,
                DstReg,             
                Clk,
                WBEnable,
                MemReadOut,
                MemWriteOut,
                ALUOperationOut,
                Br_TakenOut,
                PCOut,
                Val1,
                Val2,
                Reg2Out,
                Src1Out,
                Src2Out,
                DstRegOut);
  
  input rst,Clk,WB_Enable,MemWrite,MemRead,Br_Taken;
  input[9:0] PC;
  input[2:0] ALUOperation;
  input[15:0] Reg1;
  input[15:0] Reg2;
  input[15:0] RegOrExtend;
  input[3:0] SrcReg1;
  input[3:0] SrcReg2Or0;
  input[3:0] DstReg;
  
  output reg WBEnable;
  output reg MemReadOut;
  output reg MemWriteOut;
  output reg Br_TakenOut;
  output reg [2:0] ALUOperationOut;
  output reg [9:0] PCOut;
  output reg [15:0] Val1;
  output reg [15:0] Val2;
  output reg [15:0] Reg2Out;
  output reg [3:0] Src1Out;
  output reg [3:0] Src2Out;
  output reg [3:0] DstRegOut;
  
  always@(posedge Clk, posedge rst) begin
    if(rst) begin
      WBEnable <= 0;
      MemReadOut <= 0;
      MemWriteOut <= 0;
      Br_TakenOut <= 0;
      ALUOperationOut <= 0;
      PCOut <= 0;
      Val1 <= 0;
      Val2 <= 0;
      Reg2Out <= 0;
      Src1Out <= 0;
      Src2Out <= 0;
      DstRegOut <= 0;
    end
    else begin
      WBEnable<=WB_Enable;
      MemWriteOut<=MemWrite;
      MemReadOut<=MemRead;
      Br_TakenOut<=Br_Taken;
      PCOut<=PC;
      ALUOperationOut<=ALUOperation;
      Val1<=Reg1;
      Reg2Out<=Reg2;
      Val2<=RegOrExtend;
      Src1Out<=SrcReg1;
      Src2Out<=SrcReg2Or0;
      DstRegOut<=DstReg; 
    end
  end

endmodule