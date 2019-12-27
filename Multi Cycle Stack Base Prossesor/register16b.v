module register16b (
	clk,
	rst,
	En,
	regIn,
	regOut
);
	input clk;
	input rst;
	input En;
	input [7:0] regIn;
	output reg [7:0] regOut;
	
	always @(posedge clk,posedge rst) begin
		if(rst)
			regOut <= 8'b0;
		else begin
			if(En==1)
				regOut <= regIn;
		end

	end

endmodule

