
module IF_IDreg(rst,
                IF_IDWrite,
                Clk,
                instruction,
                instructionOut);
  
  input rst;
  input Clk;
 input IF_IDWrite;
  input[31:0] instruction;
  output reg[31:0] instructionOut;
  
  always@(posedge Clk, posedge rst) begin
    if(rst) begin
      instructionOut <= 0;
    end
    else begin 
     if(IF_IDWrite)
      instructionOut <= instruction;
     else
      instructionOut <= instructionOut;  
    end
  end

endmodule