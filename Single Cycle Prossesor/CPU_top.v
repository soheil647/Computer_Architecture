module CPU_top (
  Clk,
  Rst,
  );
  input Clk;
  input Rst;
  wire Branch,JumpControl,MemRead,RegWrite,MemWrite,ALUSrc;
  wire [1:0] WndSelect;
  wire [1:0] ALUOprand;
  wire [1:0] WriteControl;
  wire [15:0] Instr2ctrl;
  
CPU_Controller ctrl(Instr2ctrl[15:12],
                      Instr2ctrl[7:0],
                      Branch,
                      JumpControl,
                      MemRead,
                      MemWrite,
                      WriteControl,
                      ALUSrc,
                      RegWrite,
                      WndSelect,
                      ALUOprand,
                      Rst);
                       


                      
CPU_Data dp    (Branch,
                JumpControl,
                MemRead,
                MemWrite,
                WriteControl,
                ALUOprand,
                ALUSrc,
                RegWrite,
                WndSelect,
                Instr2ctrl,
                Clk,
                Rst);
                
 
  
                  
endmodule