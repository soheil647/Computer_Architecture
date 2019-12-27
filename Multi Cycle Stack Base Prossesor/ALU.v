
module ALU(
	Op1,
	Op2,
	ALUOperation,
	ALUresult,
);
           
           
  input [7:0] Op1;
  input [7:0] Op2;
  input[1:0] ALUOperation;
  output reg[7:0] ALUresult;
  
  
  parameter AND = 2'b00;
  parameter NOT = 2'b01;
  parameter Add = 2'b10;
  parameter Sub = 2'b11;
  
  
  always@(*) begin
    
    case(ALUOperation) 
      
      AND: begin
        ALUresult = Op1 & Op2;
      end
      
      NOT: begin
        ALUresult = ~Op1;
      end
      
      Add: begin
        ALUresult = Op1 + Op2;
      end
      
      Sub: begin
        ALUresult = Op1 - Op2;
      end    
      
    endcase
  end
  
endmodule
