library verilog;
use verilog.vl_types.all;
entity Mem_WBreg is
    port(
        rst             : in     vl_logic;
        WB_Enable       : in     vl_logic;
        MemRead         : in     vl_logic;
        PC              : in     vl_logic_vector(9 downto 0);
        ALU_Result      : in     vl_logic_vector(15 downto 0);
        DataMem         : in     vl_logic_vector(15 downto 0);
        Dst_Mem         : in     vl_logic_vector(3 downto 0);
        Clk             : in     vl_logic;
        WBEnable        : out    vl_logic;
        MemReadOut      : out    vl_logic;
        PCOut           : out    vl_logic_vector(9 downto 0);
        ALU_ResultOut   : out    vl_logic_vector(15 downto 0);
        DataMemOut      : out    vl_logic_vector(15 downto 0);
        Dst_WB          : out    vl_logic_vector(3 downto 0)
    );
end Mem_WBreg;
