
module PC(
	clk,
	rst,
	PCwrite,
	PCin,
	PCout
);
	input clk;
	input rst; 
	input PCwrite;     
	input [4:0] PCin;
	output reg [4:0] PCout;           

    always @(posedge clk , posedge rst) begin
      if(rst)
        PCout <= 10'b0;
      else
		if(PCwrite)
			PCout <= PCin;
    end
    
  endmodule
        