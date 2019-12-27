library verilog;
use verilog.vl_types.all;
entity Register_File is
    generic(
        Wnd0            : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        Wnd1            : vl_logic_vector(0 to 1) := (Hi0, Hi1);
        Wnd2            : vl_logic_vector(0 to 1) := (Hi1, Hi0);
        Wnd3            : vl_logic_vector(0 to 1) := (Hi1, Hi1)
    );
    port(
        Read1_Wire      : in     vl_logic_vector(1 downto 0);
        Read2_Wire      : in     vl_logic_vector(1 downto 0);
        Write_Wire      : in     vl_logic_vector(1 downto 0);
        Write_Data      : in     vl_logic_vector(15 downto 0);
        WndSel          : in     vl_logic_vector(1 downto 0);
        Clock           : in     vl_logic;
        Rst             : in     vl_logic;
        RegWrite        : in     vl_logic;
        Read_Data1      : out    vl_logic_vector(15 downto 0);
        Read_Data2      : out    vl_logic_vector(15 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Wnd0 : constant is 1;
    attribute mti_svvh_generic_type of Wnd1 : constant is 1;
    attribute mti_svvh_generic_type of Wnd2 : constant is 1;
    attribute mti_svvh_generic_type of Wnd3 : constant is 1;
end Register_File;
