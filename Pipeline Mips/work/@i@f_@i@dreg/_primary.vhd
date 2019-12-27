library verilog;
use verilog.vl_types.all;
entity IF_IDreg is
    port(
        rst             : in     vl_logic;
        IF_IDWrite      : in     vl_logic;
        Clk             : in     vl_logic;
        instruction     : in     vl_logic_vector(31 downto 0);
        instructionOut  : out    vl_logic_vector(31 downto 0)
    );
end IF_IDreg;
