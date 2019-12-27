library verilog;
use verilog.vl_types.all;
entity EX_Memreg is
    port(
        rst             : in     vl_logic;
        WB_Enable       : in     vl_logic;
        MemWrite        : in     vl_logic;
        MemRead         : in     vl_logic;
        PC              : in     vl_logic_vector(9 downto 0);
        ALU_Result      : in     vl_logic_vector(15 downto 0);
        ST_Value        : in     vl_logic_vector(15 downto 0);
        DstReg          : in     vl_logic_vector(3 downto 0);
        Clk             : in     vl_logic;
        WBEnable        : out    vl_logic;
        MemReadOut      : out    vl_logic;
        MemWriteOut     : out    vl_logic;
        PCOut           : out    vl_logic_vector(9 downto 0);
        ALU_ResultOut   : out    vl_logic_vector(15 downto 0);
        ST_ValueOut     : out    vl_logic_vector(15 downto 0);
        DstRegOut       : out    vl_logic_vector(3 downto 0)
    );
end EX_Memreg;
