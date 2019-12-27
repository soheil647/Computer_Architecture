module CPU_TB();

reg clk;
reg rst;

CPU_Top MIPSMC (clk,rst);

initial clk=0;
always #20 clk=~clk;

initial begin
rst=0;
#100
rst =1;
#100
rst=0;

#10000
$stop;	

end


endmodule