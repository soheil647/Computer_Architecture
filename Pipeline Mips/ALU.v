
module ALU(Op1,
           Op2,
           ALUOperation,
           ALUresult);
           
           
  input[15:0] Op1 , Op2;
  input[2:0] ALUOperation;
  output reg[15:0] ALUresult;
 
  
  
  parameter AND = 3'b000;
  parameter OR = 3'b001;
  parameter Add = 3'b010;
  parameter Sub = 3'b011;
  parameter Slt = 3'b100;
  
  
  always@(*) begin
    
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
      end 
      
      Slt: begin
        ALUresult = (Op1 > Op2 ) ? 1 : 0;  
      end
      
    endcase
  end
  
endmodule
