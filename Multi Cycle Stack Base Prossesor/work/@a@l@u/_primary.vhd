library verilog;
use verilog.vl_types.all;
entity ALU is
    generic(
        \AND\           : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        \NOT\           : vl_logic_vector(0 to 1) := (Hi0, Hi1);
        Add             : vl_logic_vector(0 to 1) := (Hi1, Hi0);
        Sub             : vl_logic_vector(0 to 1) := (Hi1, Hi1)
    );
    port(
        Op1             : in     vl_logic_vector(7 downto 0);
        Op2             : in     vl_logic_vector(7 downto 0);
        ALUOperation    : in     vl_logic_vector(1 downto 0);
        ALUresult       : out    vl_logic_vector(7 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of \AND\ : constant is 1;
    attribute mti_svvh_generic_type of \NOT\ : constant is 1;
    attribute mti_svvh_generic_type of Add : constant is 1;
    attribute mti_svvh_generic_type of Sub : constant is 1;
end ALU;
