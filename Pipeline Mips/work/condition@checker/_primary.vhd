library verilog;
use verilog.vl_types.all;
entity conditionChecker is
    generic(
        JUMP            : vl_logic_vector(0 to 1) := (Hi0, Hi1);
        BNE             : vl_logic_vector(0 to 1) := (Hi1, Hi0);
        BEZ             : vl_logic_vector(0 to 1) := (Hi1, Hi1)
    );
    port(
        reg1            : in     vl_logic_vector(15 downto 0);
        reg2            : in     vl_logic_vector(15 downto 0);
        cuBranchComm    : in     vl_logic_vector(1 downto 0);
        brCond          : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of JUMP : constant is 1;
    attribute mti_svvh_generic_type of BNE : constant is 1;
    attribute mti_svvh_generic_type of BEZ : constant is 1;
end conditionChecker;
