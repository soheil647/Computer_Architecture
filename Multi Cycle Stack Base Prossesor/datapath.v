module datapath(
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
	input clk;
	input rst;
	input IorD;
	input MtoS;
	input srcA;
	input srcB;
	input PCwrite;
	input PCwritecond;
	input PCsrc;
	input IRwrite;
	input MemRead;
	input MemWrite;
	input ldA;
	input ldB;
	input push;
	input pop;
	input tos;
	input [1:0] ALUOperation;
	output [2:0] Opcode;
	
  	wire [7:0] zeroreg;
	wire PCEn;
	wire [4:0] address;
	wire [7:0] Stackin;
	wire [7:0] IRout;
	wire [7:0] MDRout;
	wire [7:0] ReadData;
	wire [7:0] Stackout;
	wire [7:0] Op1;
	wire [7:0] Op2;
	wire [7:0] ALUresult;
	wire [7:0] ALUout;
	wire [4:0] PCout;
	wire [4:0] PCin;
  	wire [7:0] Aout;
	wire [7:0] Bout;


	mux2to1 I_D(
		IorD,
		PCout,
		IRout[4:0],
		address
	);
	
	Memory Memory(
		rst,
		MemRead,
		MemWrite,
		address,
		Aout,
		ReadData
	);
	
		register16b IR(
		clk,
		rst,
		IRwrite,
		ReadData,
		IRout
	);
	
	assign Opcode = IRout[7:5];
	
		register16b MDR(
		clk,
		rst,
		1'b1, 
		ReadData,
		MDRout
	);

	mux2to1 M_S(
		MtoS,
		ALUout,
		MDRout,
		Stackin
	);
	
	Stack Stack(
		clk,
		rst,
		push,
		pop,
		tos,
		Stackin,
		Stackout
	);
	
	register16b Z(
		clk,
		rst,
		1'b1, 
		Stackout,
		zeroreg
	);
	
	register16b A(  
		clk,
		rst,
		ldA,
		Stackout,
		Aout
	);

	register16b B(
		clk,
		rst,
		ldB,
		Stackout,
		Bout
	);


	mux2to1 AOP(
		srcA,
		Aout,
		{{3{PCout[4]}},PCout}, 
		Op1
	);

	mux2to1 BOP (
		srcB,
		Bout,
		8'b00000001,
		Op2
	);
	
	ALU ALU(
		Op1,
		Op2,
		ALUOperation,
		ALUresult
	);
	

	
	register16b ALUreg(
		clk,
		rst,
		1'b1,
		ALUresult,
		ALUout
	);

	mux2to1 ALUtoPC (
		PCsrc,
		ALUresult[4:0],
		IRout[4:0],
		PCin
	);

	reg zflag;
	always @(*)begin
		if(zeroreg==0)
			zflag=1;
	end

	assign PCEn = PCwrite || (zflag && PCwritecond);
	
	PC PC1(
		clk,
		rst,
		PCEn,
		PCin,
		PCout
	);

endmodule