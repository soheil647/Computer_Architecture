module Data_Memory(Address,
                   Rst,
                   Write_Data,
                   MemRead,
                   MemWrite,
                   Read_Data);
                   
  
  input[9:0] Address;
  input Rst;
  input[15:0] Write_Data;
  input MemRead,MemWrite;
  output reg[15:0] Read_Data;
  reg[15:0] DataMem [0:1023];
  
  
  always@(*) begin
  
    if(Rst)begin
		$readmemb("Dmem.b",DataMem);
    end
	
	 if(MemRead) begin
      Read_Data = DataMem[Address];
    end
    
    if(MemWrite) begin
      DataMem[Address] = Write_Data;
	  $writememb("Dmem.b",DataMem);
    end
    
  end          

endmodule
    
    
  
