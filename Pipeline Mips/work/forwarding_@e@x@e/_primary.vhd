library verilog;
use verilog.vl_types.all;
entity forwarding_EXE is
    port(
        src1_EXE        : in     vl_logic_vector(3 downto 0);
        src2_EXE        : in     vl_logic_vector(3 downto 0);
        ST_src_EXE      : in     vl_logic_vector(3 downto 0);
        dest_MEM        : in     vl_logic_vector(3 downto 0);
        dest_WB         : in     vl_logic_vector(3 downto 0);
        WB_EN_MEM       : in     vl_logic;
        WB_EN_WB        : in     vl_logic;
        val1_sel        : out    vl_logic_vector(1 downto 0);
        val2_sel        : out    vl_logic_vector(1 downto 0);
        ST_val_sel      : out    vl_logic_vector(1 downto 0)
    );
end forwarding_EXE;
