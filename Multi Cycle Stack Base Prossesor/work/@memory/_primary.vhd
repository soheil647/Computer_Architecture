library verilog;
use verilog.vl_types.all;
entity Memory is
    port(
        rst             : in     vl_logic;
        MemRead         : in     vl_logic;
        MemWrite        : in     vl_logic;
        Address         : in     vl_logic_vector(4 downto 0);
        WriteData       : in     vl_logic_vector(7 downto 0);
        ReadData        : out    vl_logic_vector(7 downto 0)
    );
end Memory;
