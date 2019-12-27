
module Instruction_Memory(Address,
                          Rst,
                          Instruction);
                          
                          
  input[9:0] Address;
  input Rst;
  output reg[15:0] Instruction;
  
  reg[15:0] InstMem[0:1024];
  
  always@(*) begin
    if(Rst)begin
      $readmemb("Imem.b",InstMem);
    end
   
   
    Instruction = InstMem[Address];
   
  end
  
              
  
endmodule