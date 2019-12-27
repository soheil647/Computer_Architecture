   
module CPU_Controller(Opcode,
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
  
                
  input[5:0] Opcode;
  input[5:0] Function;
  input Rst;
  
  output reg MemRead,RegWrite,MemWrite,ALUSrc,Is_Br,Is_Imm,StoreOrBranch;
  output reg[2:0] ALUOprand;
  output reg[1:0] BranchCommand;
    //Define Opcodes
  
      parameter Load = 6'b100011;
      parameter Store = 6'b101011;
      parameter Jump = 6'b000010;
      parameter Brancheq = 6'b000100;
      parameter Branchne = 6'b000101;
      parameter RType = 6'b000000;
      parameter NOP = 6'b000001;
      
    //Define Functions
      
      parameter Add  = 6'b100000;
      parameter Sub  = 6'b100010;
      parameter And  = 6'b100100;
      parameter Or   = 6'b100101;
      parameter slt  = 6'b101010;
      
      //Branch Command
      parameter JUMP = 2'd1;
      parameter BNE = 2'd2;
      parameter BEZ = 2'd3;
      
      //ALU Command
      parameter AND = 3'b000;
      parameter OR = 3'b001;
      parameter ADD = 3'b010;
      parameter SUB = 3'b011;
      parameter SLT = 3'b100;
      
   
     always @(Opcode , Function) begin
       MemRead=1'b0;RegWrite=1'b0;MemWrite=1'b0;ALUSrc=1'b0;
       Is_Br=1'b0;Is_Imm=1'b0;StoreOrBranch=1'b0;ALUOprand=2'b00;BranchCommand=2'b00;
       
       if(Rst) begin
       MemRead=1'b0;RegWrite=1'b0;MemWrite=1'b0;ALUSrc=1'b0;
       Is_Br=1'b0;Is_Imm=1'b0;StoreOrBranch=1'b0;ALUOprand=2'b00;BranchCommand=2'b00;         
       end
       
        case(Opcode)  
         Load: begin
           MemRead = 1'b1;
           RegWrite = 1'b1;
           ALUOprand = ADD;
           Is_Imm = 1;
           ALUSrc = 1'b1;
           StoreOrBranch = 1'b1;
         end 
         
         Store: begin
           ALUOprand = ADD;
           MemWrite =1'b1;
           Is_Imm = 1;
           StoreOrBranch = 1;
           ALUSrc = 1'b1;
         end
         
         Jump: begin
           BranchCommand = JUMP;
           Is_Imm = 1;
           Is_Br = 1;
           ALUSrc = 1'b1;
         end
         
         Brancheq:begin
           BranchCommand = BEZ;
           Is_Br =1'b1;
           Is_Imm = 1;
           ALUSrc = 1'b1;
         end
         
         Branchne:begin
           BranchCommand = BNE;
           Is_Br = 1'b1;
           Is_Imm = 1;
           StoreOrBranch = 1;
           ALUSrc = 1'b1;
         end   
         
         NOP:begin
         end
               
         RType:begin
           case(Function)
            
             Add:begin
			        	ALUSrc = 1'b0;
               ALUOprand = ADD;
               RegWrite = 1'b1;
             end
             
             Sub:begin
				       ALUSrc = 1'b0;
               ALUOprand = SUB;
               RegWrite = 1'b1; 
             end
             
             And:begin
			        	ALUSrc = 1'b0;
               ALUOprand = AND;
               RegWrite = 1'b1;  
             end
             
             Or:begin
			        	ALUSrc = 1'b0;
               ALUOprand = OR;
               RegWrite = 1'b1;
             end
             
             slt:begin
             	 ALUSrc = 1'b0;
               ALUOprand = SLT;
               RegWrite = 1'b1;
             end
           endcase
         end
        endcase 
	    end     
endmodule      
     
          