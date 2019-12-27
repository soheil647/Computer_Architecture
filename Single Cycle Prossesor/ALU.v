
module ALU(Op1,
           Op2,
           ALUOperation,
           ALUresult,
           Zero);
           
           
  input[15:0] Op1 , Op2;
  input[1:0] ALUOperation;
  output reg[15:0] ALUresult;
  output reg Zero;  
  
  
  parameter AND = 2'b00;
  parameter OR = 2'b01;
  parameter Add = 2'b10;
  parameter Sub = 2'b11;
  
  
  always@(*) begin
    Zero=0;
    
    case(ALUOperation) 
      
      AND: begin
        ALUresult = Op1 & Op2;
      end
      
      OR: begin
        ALUresult = Op1 | Op2;
      end
      
      Add: begin
        ALUresult = Op1 + Op2;
      end
      
      Sub: begin
        ALUresult = Op1 - Op2;
        if(ALUresult == 0)
          Zero = 1;
      end    
      
    endcase
  end
  
endmodule
