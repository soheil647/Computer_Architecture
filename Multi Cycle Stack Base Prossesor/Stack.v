module Stack(
	clk,
	rst,
	push,
	pop,
	tos,
	Din,
	Dout
);
	input clk;
	input rst;
	input push;
	input pop;
	input tos;
	input [7:0] Din;
	output reg [7:0] Dout;
	
	reg[7:0] stack_pointer;
	
	reg [7:0] stack [0:15];

	always @(posedge clk) begin
	  if(rst) begin
	    stack_pointer <= 0;
	    //stack[stack_pointer] <= 0;
	  end   
		
		if(pop) begin
		  Dout <= stack[stack_pointer-1];
		  stack_pointer <= stack_pointer-1;
		end
		
		if(push) begin
		  stack_pointer <= stack_pointer+1;
		  stack[stack_pointer] <= Din;
		end
		
		if(tos) begin
		  Dout <= stack[stack_pointer];
	  end
	  
	end
endmodule