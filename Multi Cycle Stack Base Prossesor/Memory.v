module Memory(
	rst,
	MemRead,
	MemWrite,
	Address,
	WriteData,
	ReadData
);

  input rst;
  input MemRead;
  input MemWrite;
  input[4:0] Address;
  input[7:0] WriteData;
  output reg[7:0] ReadData;
  
  reg[7:0] Mem [0:31];
  
  always@(*) begin
  
    if(rst)begin
		$readmemb("mem.b",Mem);
    end
	
	 if(MemRead) begin
      ReadData = Mem[Address];
    end
    if(MemWrite) begin
      Mem[Address] = WriteData;
	  $writememb("mem.b",Mem);
    end
    
  end          

endmodule
    
    
  
