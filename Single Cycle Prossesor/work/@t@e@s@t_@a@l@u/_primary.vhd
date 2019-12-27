library verilog;
use verilog.vl_types.all;
entity TEST_ALU is
    generic(
        \AND\           : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        \OR\            : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi1);
        Add             : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi0);
        Sub             : vl_logic_vector(0 to 2) := (Hi1, Hi1, Hi0);
        SLT             : vl_logic_vector(0 to 2) := (Hi1, Hi1, Hi1)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of \AND\ : constant is 1;
    attribute mti_svvh_generic_type of \OR\ : constant is 1;
    attribute mti_svvh_generic_type of Add : constant is 1;
    attribute mti_svvh_generic_type of Sub : constant is 1;
    attribute mti_svvh_generic_type of SLT : constant is 1;
end TEST_ALU;
