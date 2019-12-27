module mux2to1 (
	sel,
	muxIn0,
	muxIn1,
	muxOut
);
	input sel;
	input [7:0] muxIn0;
	input [7:0] muxIn1;
	output [7:0] muxOut;

assign muxOut = (sel==1) ? muxIn1  : muxIn0  ;

endmodule