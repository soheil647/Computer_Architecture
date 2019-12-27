
module cache (
	input clk,
	input rst,
	input [31:0] write_data,
	input [14:0] read_address, // {addr[14:12],addr[11:0]} = {cacheaddr,tag}
	output reg [31:0] cache_out,
	output reg hit,
	output reg miss
);
	reg rEn;
	reg wEn;
	reg [2:0] i;
	wire [11:0] cache_addr;
	reg [35:0] CACHE [0:4095]; //13bit address //3bit tag 1bit valid {valid,tag,data}
	reg [14:0] last_address;

	assign cache_addr = read_address[11:0];

	always @(posedge clk) begin : controlstart
		if (rst == 1) begin
			rEn <= 0;
			wEn <= 0;
			i <=0;
			last_address <=0;
		end else if (rst == 0) begin
			rEn <= 1;
			wEn <= 0;
		end
	end
	always @(posedge clk) begin : read
		if(rEn) begin
			last_address <= read_address;
			if ( (CACHE[cache_addr][35]==1) && (CACHE[cache_addr][34:32] == read_address[14:12]) ) begin 
				cache_out <= CACHE[cache_addr][31:0];

				hit <= 1;
				rEn <= 1;
				miss <= 0;
				wEn <= 0;
			end
			else begin 
				hit <= 0;
				rEn <= 0;
				miss <= 1;
				wEn <= 1;
			end
		end
	end
	
	always @(posedge clk) begin : write
		if(wEn) begin 
			if( i < 3'b011) begin
				i <= i + 1;
				last_address <= last_address + 1;
				CACHE[last_address[11:0]] <= {1, last_address[14:12], write_data};
				rEn <= 0;
				wEn <= 1;
				miss <= 0;
			end
			else begin
				i <= 0;
				rEn <= 1;
				wEn <=0;
			end	
		end
	end

endmodule

module memory (
	input clk,
	input [14:0] address,
	output reg [31:0] mem_out
);

reg [31:0] MEM [0:32767]; //15bit address
initial $readmemb("mem.mem",MEM);

always @(posedge clk) begin 
	mem_out <= MEM[address];
end

endmodule
