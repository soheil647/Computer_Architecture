module exp_controller(
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
	input  clk;
	input  rst;
	input [2:0] Opcode;
	output reg IorD;
	output reg MtoS;
	output reg srcA;
	output reg srcB;
	output reg PCwrite;
	output reg PCwritecond; 
	output reg PCsrc;
	output reg IRwrite;
	output reg MemRead;
	output reg MemWrite;
	output reg ldA;
	output reg ldB;
	output reg push;
	output reg pop;
	output reg tos;
	output reg [1:0] ALUOperation;

	
	reg [3:0] NS ;
	reg [3:0] PS ;
	//state paramete
	parameter  IF  = 4'b0000;
	parameter  TOS = 4'b0001;
	parameter  JUMP  = 4'b0010;
	parameter  JUMPZ  = 4'b0011;
	parameter  PUSH1 = 4'b0100;
	parameter  PUSH2 = 4'b0101;
	parameter  POP1 = 4'b0110;
	parameter  POP2   = 4'b0111;
	parameter  POP3 = 4'b1000;
	parameter  Rtype0  = 4'b1001;
	parameter  Rtype1  = 4'b1010;
	parameter  Rtype2  = 4'b1011;
	parameter  RtypeNOT  = 4'b1100;
	parameter  RtypeEND  = 4'b1101;
	
	//Opcode paramete
	parameter ADD = 3'b000;
	parameter SUB = 3'b001;
	parameter AND = 3'b010;
	parameter NOT = 3'b011;
	parameter PUSH = 3'b100;
	parameter POP = 3'b101;
	parameter JMP = 3'b110;
	parameter JZ = 3'b111;
	
	always @(*) begin
		IorD = 0;
		MtoS = 0;
		srcA = 0;
		srcB = 0;
		PCwrite = 0;
		PCwritecond = 0;
		PCsrc = 0;
		IRwrite = 0;
		MemRead = 0;
		MemWrite = 0;
		ldA = 0;
		ldB = 0;
		push = 0;
		pop = 0;
		tos = 0;
		ALUOperation = 2'b00;
		
		case(PS)
		  
			IF : begin
				IorD =0;
				srcA =1;
				srcB =1;
				ALUOperation = 2'b10;
				PCsrc =0;
				PCwrite =1;
				MemRead =1;
				IRwrite =1;
				NS = TOS;
			end
			
			TOS : begin
				tos=1;
				if(Opcode == JMP)
					NS = JUMP;
				else if(Opcode == JZ)
					NS = JUMPZ;
				else if(Opcode == PUSH) 
					NS = PUSH1;
				else if(Opcode == POP || Opcode == ADD || Opcode == SUB || Opcode == AND || Opcode == NOT) 
					NS = POP1;	
			end
			
			JUMP : begin
				PCsrc =1;
				PCwrite = 1;
				NS = IF;
			end
			
			JUMPZ : begin
				PCsrc =1;
				PCwritecond=1;
				NS = IF;
			end
			
			PUSH1 : begin
				IorD =1;
				MemRead=1;
				NS = PUSH2;
			end
			
			PUSH2 : begin
				MtoS =1;
				push=1;
				NS = IF;
			end	
			
			POP1 : begin
				pop =1;
				NS = POP2;
			end
			POP2 : begin
				ldA=1;
				if(Opcode == POP) 
					NS = POP3;
				else if(Opcode == NOT) 
        			NS = RtypeNOT;
        		else if(Opcode == ADD || Opcode == SUB || Opcode == AND)
        			NS = Rtype0;
				
			end	
			
			POP3 : begin
				IorD =1;
				MemWrite=1;
				NS = IF;
			end	
			
			Rtype0 : begin
				pop=1;
				NS = Rtype1;
			end
			Rtype1 : begin
				ldB=1;
				NS = Rtype2;
			end
			Rtype2 : begin
			  if(Opcode == ADD) 
				ALUOperation=2'b10;
				else if(Opcode == AND)
				ALUOperation=2'b00;  
				else if(Opcode == SUB)
				ALUOperation=2'b11; 
				 
				NS = RtypeEND;
			end
			
			RtypeNOT : begin
				ALUOperation=2'b01;
				NS = RtypeEND;
			end
			
			RtypeEND : begin
				push=1;
				NS = IF;
			end
			
		endcase
	end
	
	always @(posedge clk,posedge rst) begin 
		if(rst)
			PS <= IF;
		else
			PS <= NS;
	end

endmodule