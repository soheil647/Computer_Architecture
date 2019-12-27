
module CPU_Data(MemRead,
                MemWrite,
                ALUOperation,
                ALUSrc,
                RegWrite,
                Clk,
                Rst,
                StoreOrBNE,
                Is_imm,
                Is_Br,
                cuBranchComm,
                Opcode,
                Function);
                
  input   MemRead, MemWrite, RegWrite, ALUSrc, Clk,Rst;
  input StoreOrBNE,Is_imm;
  input Is_Br;
  input[1:0] cuBranchComm;
  input[2:0] ALUOperation;
  output[5:0] Opcode;
  output[5:0] Function;
  
  
  wire [9:0] PC;
  wire [9:0] PC_Next;
  wire [31:0] Instruction;
  wire [31:0] InstructionOut;
  wire[15:0] AddresssSignExtend;
  wire[15:0] Write_DataWire;
  wire [15:0] ALUOprand2;
  reg [15:0] Write_DataReg;
  reg BranchControl;
  wire Zero;
  wire [15:0] Read_Data1;
  wire [15:0] Read_Data2;  
  wire [15:0]  ALUresult;
  
  
  wire [9:0] BRor4;
  wire [3:0] Src2;
  wire [3:0] DstReg_Mem;  
  wire [3:0] DstReg_EX;
  wire [3:0] Src2Or0_EX;
  wire [3:0] Src1_EX;
  wire [3:0] Dst_WB;
  wire Br_Taken;
  wire Br_Taken_EX;
  reg [3:0] Src2Or0;
  wire MemReadOUT;
  wire MemWriteOUT;
  wire RegWrite_EX;
  wire RegWrite_Mem;
  wire RegWrite_WB;
  wire MemRead_EX;
  wire MemRead_Mem;
  wire MemRead_WB;
  wire MemWrite_EX;
  wire MemWrite_Mem;
  wire[2:0] ALUOperationOut;
  wire [9:0] PC_EX;
  wire [9:0]  PC_Mem;
  wire [9:0]  PC_WB;
  wire[15:0] Val1;
  wire [15:0]  Val2;
  wire [15:0]  Read_Data2_EX;
  wire[15:0] ALU_Oprand1;
  wire [15:0]  ALU_Oprand2;
  wire [15:0]  ST_Oprand_EX;
  wire [15:0]  ST_Oprand_Mem;
  wire[15:0] ALU_Result_EX;
  wire [15:0]  ALU_Result_Mem;
  wire [15:0]  ALU_Result_WB;
  wire[15:0] Memory_Data_Mem;
  wire [15:0]  Memory_Data_WB;
  wire [15:0]  DATA_WB;
  wire CheckOut;
  wire Hazard_Detect;
  wire [1:0] FWA;
  wire [1:0]  FWB;
  wire [1:0]  FWST;
  
  assign BRor4 = Br_Taken ? InstructionOut[9:0] : 1;   //Offset = instruction offset in branch
  assign PC_Next = BRor4 + PC ;
  
  PC_Reg PC_Reg  (PC_Next,
                  ~Hazard_Detect,
                  Clk,
                  Rst,
                  PC);
  
  Instruction_Memory IMem (PC,
                           Rst,
                           Instruction);
                           
  
  IF_IDreg Reg1(Rst,~Hazard_Detect,         
                Clk,
                Instruction,
                InstructionOut);
                          
     //NEXT STAGE                     
                          
  
  assign Src2 = StoreOrBNE ? InstructionOut[25:22] : InstructionOut[17:14];
  
  assign Opcode = InstructionOut[31:26];
  assign Function = InstructionOut[5:0];
                   
  Register_File RFile (InstructionOut[21:18],
                       Src2,
                       Dst_WB,
                       DATA_WB,
                       Clk,
                       Rst,
                       RegWrite_WB,
                       Read_Data1,
                       Read_Data2);
                       
                       
 assign AddresssSignExtend = {{5{1'b0}}, InstructionOut[9:0] };  
  
 assign ALUOprand2 = ALUSrc? AddresssSignExtend : Read_Data2;                    
                       
 conditionChecker CC1 (
  Read_Data1,
  Read_Data2,
  cuBranchComm,
  CheckOut);

 assign Br_Taken = Is_Br & CheckOut;  
        always @(*) begin
      if(Is_imm)
        Src2Or0 <= 4'b0;
       else 
        Src2Or0 <= InstructionOut[17:14]; 
      end 
        
             
    // Src2Or0 = Is_imm ? InstructionOut[17:14] : 4'b0;   
 
 assign MemReadOUT = Hazard_Detect ? 0 : MemRead;           
 assign MemWriteOUT = Hazard_Detect ? 0 : MemWrite; 
 
 
 
  ID_EXreg Reg2(Rst,RegWrite,
                MemWriteOUT,
                MemReadOUT,
                ALUOperation,
                Br_Taken,
                PC,
                Read_Data1,
                Read_Data2,
                ALUOprand2,
                InstructionOut[21:18],
                Src2Or0,
                InstructionOut[25:22],             
                Clk,
                RegWrite_EX,
                MemRead_EX,
                MemWrite_EX,
                ALUOperationOut,
                Br_Taken_EX,
                PC_EX,
                Val1,
                Val2,
                Read_Data2_EX,
                Src1_EX,
                Src2Or0_EX,
                DstReg_EX);  
                
        //NEXT STAGE                    
      
 assign ALU_Oprand1 = (FWA == 2'b00) ? Val1 : (FWA == 2'b01) ? ALU_Result_WB : (FWA == 2'b10) ? DATA_WB : 0;
 assign ALU_Oprand2 = (FWB == 2'b00) ? Val2 : (FWB == 2'b01) ? ALU_Result_WB : (FWB == 2'b10) ? DATA_WB : 0;
 assign ST_Oprand_EX  = (FWST == 2'b00) ? Read_Data2_EX : (FWST == 2'b01) ? ALU_Result_WB : (FWST == 2'b10) ? DATA_WB : 0;
     
  
                 
 ALU ALUnit (ALU_Oprand1,
             ALU_Oprand2,
             ALUOperationOut,
             ALU_Result_EX);
 
 EX_Memreg Reg3(Rst,RegWrite_EX,
                MemWrite_EX,
                MemRead_EX,
                PC_EX,
                ALU_Result_EX,
                ST_Oprand_EX,
                DstReg_EX,     
                Clk,
                RegWrite_Mem,
                MemRead_Mem,
                MemWrite_Mem,
                PC_Mem,
                ALU_Result_Mem,
                ST_Oprand_Mem,
                DstReg_Mem);
                
         
        
        // NEXT STAGE            
                                 
 Data_Memory DMem   (ALU_Result_Mem,
                     Rst,
                     ST_Oprand_Mem,
                     MemRead_Mem,
                     MemWrite_Mem,
                     Memory_Data_Mem);
                     
  Mem_WBreg Reg4(Rst,
                 RegWrite_Mem,
                 MemRead_Mem,
                 PC_Mem,
                 ALU_Result_Mem,
                 Memory_Data_Mem,
                 DstReg_Mem,    
                 Clk,
                 RegWrite_WB,
                 MemRead_WB,
                 PC_WB,               //NOT OK
                 ALU_Result_WB,
                 Memory_Data_WB,
                 Dst_WB);
                 
   
   
  assign DATA_WB = MemRead_WB ? Memory_Data_WB : ALU_Result_WB;
  
  
  forwarding_EXE FU (Src1_EX,
                     Src2Or0_EX,
                     DstReg_EX,
                     DstReg_Mem,
                     Dst_WB,
                     RegWrite_Mem,
                     RegWrite_WB,
                     FWA,
                     FWB,
                     FWST);
   
   hazard_detection HU (is_imm,
                        StoreOrBNE,
                        InstructionOut[21:18],
                        InstructionOut[17:14],
                        DstReg_EX,
                        RegWrite_EX,
                        DstReg_Mem,
                        RegWrite_Mem,
                        MemRead_EX,
                        cuBranchComm,
                        Hazard_Detect);
   
   
  
endmodule