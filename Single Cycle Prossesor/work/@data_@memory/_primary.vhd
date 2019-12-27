library verilog;
use verilog.vl_types.all;
entity Data_Memory is
    port(
        Address         : in     vl_logic_vector(9 downto 0);
        Rst             : in     vl_logic;
        Write_Data      : in     vl_logic_vector(15 downto 0);
        MemRead         : in     vl_logic;
        MemWrite        : in     vl_logic;
        Read_Data       : out    vl_logic_vector(15 downto 0)
    );
end Data_Memory;
