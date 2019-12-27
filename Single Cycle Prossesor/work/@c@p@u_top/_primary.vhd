library verilog;
use verilog.vl_types.all;
entity CPU_top is
    port(
        Clk             : in     vl_logic;
        Rst             : in     vl_logic
    );
end CPU_top;
