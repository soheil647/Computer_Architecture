module cache_tb ();

reg [14:0] hitcount;
reg [14:0] misscount;
reg clk;
reg rst;
reg [14:0] address;

wire [31:0] data;

wire [31:0] cache_out;
wire hit;
wire miss;

memory memut(
	.clk(clk),
	.address(address),
	.mem_out(data)
);

cache cacheut(
	.clk(clk),
	.rst(rst),
	.write_data(data),
	.read_address(address),
	.cache_out(cache_out),
	.hit(hit),
	.miss(miss)
);

initial clk = 0;
always #10 clk = ~clk;

initial address = 15'd1024;
always @(posedge clk) if (hit && (address < 16'd9216)) address = address + 1 ;

initial hitcount = 0;
always @(posedge clk) if(hit) hitcount = hitcount + 1;
initial misscount = 0;
always @(posedge clk) if(miss) misscount = misscount + 1;

initial begin 
	rst = 1'bx;
	#50
	rst =1'b1;
	#50
	rst =1'b0;
end
initial begin 
	#437083
	$stop;
end
endmodule