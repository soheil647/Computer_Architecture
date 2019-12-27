
module CPU_Data(Branch,
                JumpControl,
                MemRead,
                MemWrite,
                WriteControl,
                ALUOperation,
                ALUSrc,
                RegWrite,
                WndSelect,
                Instr2ctrl,
                Clk,
                Rst);
                
  input  Branch, JumpControl, MemRead, MemWrite, RegWrite, ALUSrc, Clk,Rst;
  input[1:0] WriteControl,WndSelect;
  input[1:0] ALUOperation;
  output[15:0] Instr2ctrl;
  wire [9:0] PC;
  reg [9:0] PC_Next,PCPluse,PC_Oprand;
  wire [15:0] Instruction;
  wire[15:0] AddresssSignExtend,Memory_Data,Write_DataWire;
  wire [15:0] ALUOprand2;
  reg [15:0] Write_DataReg;
  reg BranchControl;
  wire Zero;
  wire [15:0] Read_Data1;
  wire [15:0] Read_Data2;  
  wire [15:0]  ALUresult;
  
  assign Instr2ctrl = Instruction;
  
  PC_Reg PC_Reg  (PC_Next,
              Clk,
              Rst,
              PC);
  
  always @(*) begin
	if (Zero & Branch)
		BranchControl = 1;
	else 
		BranchControl = 0;
	if (BranchControl)
		PC_Oprand = {{2'b00},Instruction[7:0]};
	else
		PC_Oprand = PCPluse;
	if(JumpControl)
		PC_Next = Instruction[9:0];
	else 
		PC_Next = PC_Oprand;
  
  end
  
  always @(posedge Clk)if(~Rst) PCPluse = PC + 1;   
  
  Instruction_Memory IMem (PC,
						  Rst,
                          Instruction);
                          
                  
  Register_File RFile(Instruction[11:10],
                       Instruction[9:8],
                       Instruction[11:10],
                       Write_DataWire,
                       WndSelect,
                       Clk,
                       Rst,
                       RegWrite,
                       Read_Data1,
                       Read_Data2);
                       
                       
 assign AddresssSignExtend = {{6{Instruction[9]}}, Instruction[9:0] };  
 
/* always @(ALUSrc) begin
	if(ALUSrc)
		ALUOprand2 = AddresssSignExtend;
	else
		ALUOprand2 = Read_Data2;
 end */
 assign ALUOprand2 = ALUSrc? AddresssSignExtend : Read_Data2;                    
                       
                 
 ALU ALUnit (Read_Data1,
           ALUOprand2,
           ALUOperation,
           ALUresult,
           Zero);
           
           
 Data_Memory DMem   (Instruction[9:0],
				             Rst,
                     Read_Data1,
                     MemRead,
                     MemWrite,
                     Memory_Data);
  

  always @(*) begin
	if (WriteControl==2'b00)
		Write_DataReg = Memory_Data;
	else if (WriteControl==2'b01)
		Write_DataReg = ALUresult;
	else if (WriteControl==2'b10)
		Write_DataReg = Read_Data2;
	else if (WriteControl==2'b11)
		Write_DataReg = ~Read_Data2;
	else 
		Write_DataReg = 0;		
  end
  
  assign Write_DataWire = Write_DataReg; 
  
endmodule