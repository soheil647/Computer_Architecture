library verilog;
use verilog.vl_types.all;
entity hazard_detection is
    generic(
        JUMP            : vl_logic_vector(0 to 1) := (Hi0, Hi1);
        BNE             : vl_logic_vector(0 to 1) := (Hi1, Hi0);
        BEZ             : vl_logic_vector(0 to 1) := (Hi1, Hi1)
    );
    port(
        is_imm          : in     vl_logic;
        ST_or_BNE       : in     vl_logic;
        src1_ID         : in     vl_logic_vector(3 downto 0);
        src2_ID         : in     vl_logic_vector(3 downto 0);
        dest_EXE        : in     vl_logic_vector(3 downto 0);
        WB_EN_EXE       : in     vl_logic;
        dest_MEM        : in     vl_logic_vector(3 downto 0);
        WB_EN_MEM       : in     vl_logic;
        MEM_R_EN_EXE    : in     vl_logic;
        cuBranchComm    : in     vl_logic_vector(1 downto 0);
        hazard_detected : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of JUMP : constant is 1;
    attribute mti_svvh_generic_type of BNE : constant is 1;
    attribute mti_svvh_generic_type of BEZ : constant is 1;
end hazard_detection;
