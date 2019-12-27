library verilog;
use verilog.vl_types.all;
entity register16b is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        En              : in     vl_logic;
        regIn           : in     vl_logic_vector(7 downto 0);
        regOut          : out    vl_logic_vector(7 downto 0)
    );
end register16b;
