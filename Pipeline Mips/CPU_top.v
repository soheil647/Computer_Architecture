module CPU_top (
  Clk,
  Rst,
  );
  input Clk;
  input Rst;
  wire Is_Br,Is_Imm,MemRead,RegWrite,MemWrite,ALUSrc,StoreOrBranch;
  wire [2:0] ALUOprand;
  wire [1:0]  BranchCommand;
  wire [5:0] Opcode,Function;
  
CPU_Controller Cnt1  (Opcode,
                      Function,
                      MemRead,
                      MemWrite,
                      ALUSrc,
                      RegWrite,
                      ALUOprand,
                      Is_Br,
                      Is_Imm,
                      StoreOrBranch,
                      BranchCommand,
                      Rst);
                       


                      
CPU_Data DP    (MemRead,
                MemWrite,
                ALUOprand,
                ALUSrc,
                RegWrite,
                Clk,
                Rst,
                StoreOrBranch,
                Is_imm,
                Is_Br,
                BranchCommand,
                Opcode,
                Function);
                
 
  
                  
endmodule