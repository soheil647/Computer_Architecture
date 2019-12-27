library verilog;
use verilog.vl_types.all;
entity Register_File is
    port(
        Src1            : in     vl_logic_vector(3 downto 0);
        Src2            : in     vl_logic_vector(3 downto 0);
        Dst             : in     vl_logic_vector(3 downto 0);
        Write_Data      : in     vl_logic_vector(15 downto 0);
        Clock           : in     vl_logic;
        Rst             : in     vl_logic;
        RegWrite        : in     vl_logic;
        Read_Data1      : out    vl_logic_vector(15 downto 0);
        Read_Data2      : out    vl_logic_vector(15 downto 0)
    );
end Register_File;
