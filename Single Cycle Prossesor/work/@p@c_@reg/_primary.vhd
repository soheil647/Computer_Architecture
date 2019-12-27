library verilog;
use verilog.vl_types.all;
entity PC_Reg is
    port(
        PC_Next         : in     vl_logic_vector(9 downto 0);
        Clk             : in     vl_logic;
        Rst             : in     vl_logic;
        PC              : out    vl_logic_vector(9 downto 0)
    );
end PC_Reg;
