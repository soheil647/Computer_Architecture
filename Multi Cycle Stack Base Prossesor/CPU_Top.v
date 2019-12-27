module CPU_Top(clk,rst);
  
 	input clk;
	input rst;
	wire IorD;
	wire MtoS;
	wire srcA;
	wire srcB;
	wire PCwrite;
	wire PCwritecond;
	wire PCsrc;
	wire IRwrite;
	wire MemRead;
	wire MemWrite;
	wire ldA;
	wire ldB;
	wire push;
	wire pop;
	wire tos;
	wire [1:0] ALUOperation;
	wire [2:0] Opcode;
	
	datapath D1(
	clk,
	rst,
	IorD,
	MtoS,
	srcA,
	srcB,
	PCwrite,
	PCwritecond, 
	PCsrc,
	IRwrite,
	MemRead,
	MemWrite,
	ldA,
	ldB,
	push,
	pop,
	tos,
	ALUOperation,
	Opcode
);

exp_controller C1(
  clk,
	rst,
	Opcode,
	IorD,
	MtoS,
	srcA,
	srcB,
	PCwrite,
	PCwritecond,
	PCsrc,
	IRwrite,
	MemRead,
	MemWrite,
	ldA,
	ldB,
	push,
	pop,
	tos,
	ALUOperation
);

endmodule
  
